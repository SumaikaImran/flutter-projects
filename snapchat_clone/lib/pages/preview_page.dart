// Required dependencies in pubspec.yaml:
//   signature: ^5.2.1

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:media_store_plus/media_store_plus.dart';
import 'package:signature/signature.dart';

class MediaPreviewPage extends StatefulWidget {
  final String filePath;
  final bool isVideo;

  const MediaPreviewPage({
    super.key,
    required this.filePath,
    required this.isVideo,
  });

  @override
  State<MediaPreviewPage> createState() => _MediaPreviewPageState();
}

class _MediaPreviewPageState extends State<MediaPreviewPage> {
  late VideoPlayerController _videoController;
  final MediaStore _mediaStore = MediaStore();
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.red,
  );
  bool _isDrawing = false;

  @override
  void initState() {
    super.initState();
    if (widget.isVideo) {
      _videoController = VideoPlayerController.file(File(widget.filePath))
        ..initialize().then((_) {
          setState(() {});
          _videoController.play();
          _videoController.setLooping(true);
        });
    }
  }

  @override
  void dispose() {
    if (widget.isVideo) {
      _videoController.dispose();
    }
    _signatureController.dispose();
    super.dispose();
  }

  Future<void> saveToGallery() async {
    PermissionStatus status;

    if (widget.isVideo) {
      status = await Permission.videos.request();
    } else {
      status = await Permission.photos.request();
    }

    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Storage permission denied")),
      );
      return;
    }

    final file = File(widget.filePath);
    if (!file.existsSync()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("File not found")));
      return;
    }

    await MediaStore.ensureInitialized();
    MediaStore.appFolder = "MySnapApp";

    try {
      final info = await MediaStore().saveFile(
        tempFilePath: widget.filePath,
        dirType: widget.isVideo ? DirType.video : DirType.photo,
        dirName: widget.isVideo ? DirName.movies : DirName.pictures,
      );

      if (info != null && info.isSuccessful) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Saved to Gallery!")));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Failed to save file")));
      }
    } catch (e) {
      debugPrint("Save error: \$e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error saving file: \$e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: widget.isVideo
                ? (_videoController.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: VideoPlayer(_videoController),
                        )
                      : const CircularProgressIndicator())
                : Image.file(File(widget.filePath)),
          ),
          if (_isDrawing && !widget.isVideo)
            Signature(
              controller: _signatureController,
              backgroundColor: Colors.transparent,
            ),
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.close, color: Colors.white, size: 25),
                    Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.text_fields, color: Colors.white, size: 28),
                  onPressed: () {},
                  tooltip: "Add Text",
                ),
                SizedBox(height: 18),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.white, size: 28),
                  onPressed: () {
                    if (!widget.isVideo) {
                      setState(() => _isDrawing = !_isDrawing);
                    }
                  },
                  tooltip: "Draw",
                ),
                SizedBox(height: 18),
                IconButton(
                  icon: Icon(Icons.crop, color: Colors.white, size: 28),
                  onPressed: () {},
                  tooltip: "Crop",
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            right: 20,
            child: GestureDetector(
              onTap: saveToGallery,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Column(
                  children: [
                    Icon(Icons.save_alt, color: Colors.white, size: 25),
                    Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
