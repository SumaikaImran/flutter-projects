import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:snapchat/theme/colors.dart';
import 'package:camera/camera.dart';
import 'package:snapchat/pages/preview_page.dart';

class CamerePage extends StatefulWidget {
  const CamerePage({super.key});

  @override
  State<CamerePage> createState() => _CamerePageState();
}

class _CamerePageState extends State<CamerePage> {
  late List<CameraDescription> _cameras;
  late CameraController _controller;
  bool _isRecording = false;
  bool _isFrontCamera = false;
  bool _isFlashOn = false;
  bool _isCapturing = false;
  bool _isArrowDown = true;
  bool _showGrid = false;
  int _timerSeconds = 0;
  bool _isReady = false;
  double _currentZoomLevel = 1.0;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;

  @override
  void initState() {
    super.initState();
    _setupCamera();
  }

  _setupCamera() async {
    try {
      _cameras = await availableCameras();
      _isFrontCamera = _cameras[0].lensDirection == CameraLensDirection.front;
      _controller = CameraController(_cameras[0], ResolutionPreset.medium);
      await _controller.initialize();
      _minAvailableZoom = await _controller.getMinZoomLevel();
      _maxAvailableZoom = await _controller.getMaxZoomLevel();
      _currentZoomLevel = _minAvailableZoom;
    } catch (_) {}
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: getFloatingButtons(),
      body: getBody(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget cameraPreview() {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: CameraPreview(_controller),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    if (!_isReady || !_controller.value.isInitialized) {
      return SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child: SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(strokeWidth: 3),
          ),
        ),
      );
    }

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          // Positioned.fill(child: cameraPreview()),
          // ClipRRect(
          //   borderRadius: const BorderRadius.only(
          //     bottomLeft: Radius.circular(10),
          //     bottomRight: Radius.circular(10),
          //   ),
          //   child: cameraPreview(),
          // ),
          GestureDetector(
            onScaleUpdate: (details) async {
              double newZoomLevel = (_currentZoomLevel * details.scale).clamp(
                _minAvailableZoom,
                _maxAvailableZoom,
              );
              await _controller.setZoomLevel(newZoomLevel);
            },
            onScaleEnd: (_) async {
              _currentZoomLevel = _currentZoomLevel;
            },
            child: // ...existing code...
            Padding(
              padding: const EdgeInsets.only(
                top: 55.0,
              ), // Move camera preview 60px down
              child: Center(
                child: SizedBox(
                  height:
                      (MediaQuery.of(context).size.height *
                      0.7), // 70% of screen height, adjust as needed
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: CameraPreview(_controller),
                  ),
                ),
              ),
            ),
            // ...existing code...
          ),

          if (_showGrid)
            Positioned.fill(
              child: IgnorePointer(child: CustomPaint(painter: _GridPainter())),
            ),
          // ✅ Front flash white overlay (visible only when front flash is on)
          if (_isFlashOn && _isFrontCamera)
            Positioned.fill(
              // ignore: deprecated_member_use
              child: Container(color: Colors.white.withOpacity(0.95)),
            ),
        ],
      ),
    );
  }

  Widget getFloatingButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 30, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    child: Icon(Entypo.user, color: primary, size: 28),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    child: Icon(Feather.search, color: white, size: 23),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    child: Icon(Feather.user_plus, color: white, size: 25),
                  ),
                  SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: black.withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              SimpleLineIcons.refresh,
                              color: Colors.white,
                              size: 25,
                            ),
                            onPressed: () async {
                              if (_cameras.length < 2) return;
                              final newIndex =
                                  _controller.description == _cameras[0]
                                  ? 1
                                  : 0;
                              _isFrontCamera =
                                  _cameras[newIndex].lensDirection ==
                                  CameraLensDirection.front;
                              _controller = CameraController(
                                _cameras[newIndex],
                                ResolutionPreset.medium,
                              );
                              await _controller.initialize();
                              if (!mounted) return;
                              setState(() {});
                            },
                          ),

                          IconButton(
                            icon: Icon(
                              Entypo.flash,
                              color: _isFlashOn ? Colors.yellow : Colors.white,
                              size: 25,
                            ),

                            onPressed: () async {
                              if (_isFrontCamera) {
                                // Simulate front flash by white overlay
                                setState(() => _isFlashOn = true);
                                await Future.delayed(
                                  Duration(milliseconds: 100),
                                );
                                setState(() => _isFlashOn = false);
                              } else {
                                _isFlashOn = !_isFlashOn;
                                await _controller.setFlashMode(
                                  _isFlashOn ? FlashMode.torch : FlashMode.off,
                                );
                                setState(() {});
                              }
                            },
                          ),

                          // SizedBox(height: 18),
                          Icon(
                            MaterialCommunityIcons.play_box_outline,
                            color: white,
                            size: 25,
                          ),
                          Text(
                            'Play Box',
                            style: TextStyle(color: white, fontSize: 10),
                          ),
                          SizedBox(height: 18),
                          Icon(Entypo.beamed_note, color: white, size: 25),
                          Text(
                            'Sounds',
                            style: TextStyle(color: white, fontSize: 10),
                          ),
                          SizedBox(height: 18),
                          if (!_isArrowDown)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Timer option
                                  // ...inside your Column for the options...
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // Cycle through 0, 3, 5, 10 seconds
                                        if (_timerSeconds == 0) {
                                          _timerSeconds = 3;
                                        } else if (_timerSeconds == 3) {
                                          _timerSeconds = 5;
                                        } else if (_timerSeconds == 5) {
                                          _timerSeconds = 10;
                                        } else {
                                          _timerSeconds = 0;
                                        }
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.timer,
                                          color: _timerSeconds > 0
                                              ? Colors.yellow
                                              : white,
                                          size: 25,
                                        ),
                                        Text(
                                          _timerSeconds == 0
                                              ? 'Timer'
                                              : '${_timerSeconds}s',
                                          style: TextStyle(
                                            color: white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _showGrid = !_showGrid;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.grid_on,
                                          color: _showGrid
                                              ? Colors.yellow
                                              : white,
                                          size: 25,
                                        ),
                                        Text(
                                          'Grid',
                                          style: TextStyle(
                                            color: white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  // Director mode option
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.movie_creation_outlined,
                                        color: white,
                                        size: 25,
                                      ),
                                      Text(
                                        'Director',
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          IconButton(
                            icon: Icon(
                              _isArrowDown
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: white,
                              size: 25,
                            ),
                            onPressed: () {
                              setState(() {
                                _isArrowDown = !_isArrowDown;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(
                  MaterialCommunityIcons.cards_playing_outline,
                  color: white,
                  size: 28,
                ),
              ),
              SizedBox(width: 15),
              GestureDetector(
                onTap: () async {
                  if (_isRecording || _isCapturing) return;

                  setState(() {
                    _isCapturing = true;
                  });

                  if (_timerSeconds > 0) {
                    int secondsLeft = _timerSeconds;
                    await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            Future.delayed(Duration(seconds: 1), () {
                              if (secondsLeft > 1) {
                                setState(() {
                                  secondsLeft--;
                                });
                              } else {
                                Navigator.of(context).pop();
                              }
                            });
                            return Center(
                              child: Container(
                                color: Colors.black54,
                                child: Text(
                                  '$secondsLeft',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 60,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }

                  if (_isFrontCamera && _isFlashOn) {
                    await Future.delayed(Duration(milliseconds: 100));
                  }

                  try {
                    final file = await _controller.takePicture();

                    if (_isFrontCamera && _isFlashOn) {}

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MediaPreviewPage(
                          filePath: file.path,
                          isVideo: false,
                        ),
                      ),
                    );
                  } catch (e) {
                    print("Error while capturing photo: $e");
                  } finally {
                    setState(() {
                      _isCapturing = false;
                    });
                  }
                },

                onLongPressStart: (_) async {
                  // 🎥 Start recording
                  setState(() {
                    _isRecording = true;
                  });
                  await _controller.startVideoRecording();
                },
                onLongPressEnd: (_) async {
                  //  Stop recording
                  final file = await _controller.stopVideoRecording();
                  setState(() {
                    _isRecording = false;
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          MediaPreviewPage(filePath: file.path, isVideo: true),
                    ),
                  );
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: _isRecording ? 70 : 80,
                  height: _isRecording ? 70 : 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 7,
                      color: _isRecording ? Colors.red : Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 15),
              IconButton(
                onPressed: null,
                icon: Icon(Entypo.emoji_happy, color: white, size: 28),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 1;

    // Draw two vertical lines
    canvas.drawLine(
      Offset(size.width / 3, 0),
      Offset(size.width / 3, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(2 * size.width / 3, 0),
      Offset(2 * size.width / 3, size.height),
      paint,
    );

    // Draw two horizontal lines
    canvas.drawLine(
      Offset(0, size.height / 3),
      Offset(size.width, size.height / 3),
      paint,
    );
    canvas.drawLine(
      Offset(0, 2 * size.height / 3),
      Offset(size.width, 2 * size.height / 3),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
