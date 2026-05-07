import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gal/gal.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> with WidgetsBindingObserver {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  bool _isRecording = false;
  double _currentZoomLevel = 1.0;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  bool _isFlashOn = false;
  Color _bgColor = Colors.white;
  int selectedCameraIndex = 0;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (cameraController == null ||
        cameraController?.value.isInitialized == false) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _setupCameraController();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setupCameraController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildUI());
  }

  Widget _buildUI() {
    if (cameraController == null ||
        cameraController?.value.isInitialized == false) {
      return const Center(child: CircularProgressIndicator());
    }
    return SafeArea(
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onScaleUpdate: (details) async {
                double newZoomLevel = (_currentZoomLevel * details.scale).clamp(
                  _minAvailableZoom,
                  _maxAvailableZoom,
                );
                await cameraController!.setZoomLevel(newZoomLevel);
              },
              onScaleEnd: (_) async {
                _currentZoomLevel = _currentZoomLevel;
              },
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.90,
                height: MediaQuery.sizeOf(context).height * 0.75,
                child: CameraPreview(cameraController!),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(_isFlashOn ? Icons.flash_on : Icons.flash_off),
                  onPressed: toggleFlashlight,
                ),

                IconButton(
                  onPressed: () async {
                    if (_isRecording) {
                      final file = await cameraController!.stopVideoRecording();
                      setState(() => _isRecording = false);

                      final tempPath = file.path;
                      final appDir = await getExternalStorageDirectory();
                      final newPath =
                          '${appDir!.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';

                      try {
                        await File(tempPath).copy(newPath);
                        await Gal.putVideo(newPath);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Video Saved')),
                        );
                      } catch (e) {
                        print('Error saving video: $e');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error saving video: $e')),
                        );
                      }
                    } else {
                      try {
                        XFile picture = await cameraController!.takePicture();
                        print("📷 Image path: ${picture.path}");

                        await Gal.putImage(picture.path);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Image Saved')),
                        );
                      } catch (e) {
                        print(" Error saving image: $e");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error saving image: $e')),
                        );
                      }
                    }
                  },
                  onLongPress: () async {
                    try {
                      await cameraController!.prepareForVideoRecording();
                      await cameraController!.startVideoRecording();
                      setState(() => _isRecording = true);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Recording Started')),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error starting recording: $e')),
                      );
                    }
                  },
                  iconSize: 70,
                  icon: Icon(_isRecording ? Icons.stop : Icons.camera),
                ),

                const SizedBox(width: 10),
                IconButton(
                  onPressed: () async {
                    if (cameras.length < 2) return;

                    selectedCameraIndex =
                        (selectedCameraIndex + 1) % cameras.length;
                    await cameraController?.dispose();
                    await _setupCameraController();
                  },
                  iconSize: 40,
                  icon: const Icon(Icons.flip_camera_android),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _setupCameraController() async {
    List<CameraDescription> cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      setState(() {
        cameras = cameras;
        cameraController = CameraController(
          cameras[selectedCameraIndex],
          ResolutionPreset.high,
        );
      });
      cameraController
          ?.initialize()
          .then((_) async {
            if (!mounted) {
              return;
            }
            setState(() {});
            _minAvailableZoom = await cameraController!.getMinZoomLevel();
            _maxAvailableZoom = await cameraController!.getMaxZoomLevel();
            _currentZoomLevel = _minAvailableZoom;
          })
          .catchError((Object e) {
            print(e);
          });
    }
  }

  Future<void> toggleFlashlight() async {
    if (cameraController!.value.isInitialized) {
      if (cameraController!.value.flashMode == FlashMode.off) {
        await cameraController!.setFlashMode(FlashMode.torch);
        setState(() {
          _bgColor = Colors.greenAccent;
          _isFlashOn = true;
        });
      } else {
        await cameraController!.setFlashMode(FlashMode.off);
        setState(() {
          _bgColor = Colors.white;
          _isFlashOn = false;
        });
      }
    }
  }
}
