import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ffmpeg_kit_flutter_full/ffmpeg_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class VideoFilterPreview extends StatefulWidget {
  const VideoFilterPreview({super.key});

  @override
  State<VideoFilterPreview> createState() => _VideoFilterPreviewState();
}

class _VideoFilterPreviewState extends State<VideoFilterPreview> {
  File? _filteredVideo;
  VideoPlayerController? _controller;

  Future<void> _pickAndFilterVideo() async {
    final pickedFile = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (pickedFile == null) return;

    final tempDir = await getTemporaryDirectory();
    final outputPath = '${tempDir.path}/preview_filtered_video.mp4';

    // FFmpeg grayscale filter
    final ffmpegCommand =
        "-i ${pickedFile.path} -vf hue=s=0 -preset ultrafast $outputPath";

    await FFmpegKit.execute(ffmpegCommand).then((session) async {
      final returnCode = await session.getReturnCode();
      if (returnCode?.isValueSuccess() ?? false) {
        _filteredVideo = File(outputPath);
        _initializeVideoPlayer(_filteredVideo!);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to apply filter.")),
        );
      }
    });
  }

  void _initializeVideoPlayer(File videoFile) {
    _controller?.dispose();
    _controller = VideoPlayerController.file(videoFile)
      ..initialize().then((_) {
        setState(() {});
        _controller!.play();
      });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Video Filter Preview")),
      body: Center(
        child: _controller != null && _controller!.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              )
            : const Text("Pick a video to preview with filter"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _pickAndFilterVideo,
        label: const Text("Pick Video"),
        icon: const Icon(Icons.video_call),
      ),
    );
  }
}
