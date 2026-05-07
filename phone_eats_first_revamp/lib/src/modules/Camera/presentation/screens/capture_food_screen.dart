import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/app_routes.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';

class CaptureFoodScreen extends StatefulWidget {
   final VoidCallback? onClose;

  const CaptureFoodScreen({super.key, this.onClose});


  @override
  State<CaptureFoodScreen> createState() => _CaptureFoodScreenState();
}

class _CaptureFoodScreenState extends State<CaptureFoodScreen>
    with WidgetsBindingObserver {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;

  double _currentZoomLevel = 1.0;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  List<XFile> capturedImages = [];

  bool _isFlashOn = false;
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
    super.initState();
    _setupCameraController();
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
               if (widget.onClose != null) widget.onClose!(); // trigger callback
            AppRouterGo.back(); 
              },
              child: Row(
                children: [
                  Icon(
                    Icons.close,
                    color: AppColors.secondaryTextWhite,
                    size: 18,
                  ),
                  Text(' '),
                  Text(AppStrings.cancel, style: AppTextTheme.bodyWhite13),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // RateScreen();
                AppRouterGo.push(rateScreen);
              },
              child: Container(
                padding: EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                  left: 10,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.secondaryTextRed,
                    width: 2,
                  ),
                ),
                child: Text(
                  AppStrings.review,
                  style: AppTextTheme.headingWhite12,
                ),
              ),
            ),
          ],
        ),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    if (cameraController == null ||
        cameraController?.value.isInitialized == false) {
      return const Center(child: CircularProgressIndicator());
    }
    return SafeArea(
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 5),
              child: GestureDetector(
                onScaleUpdate: (details) async {
                  double newZoomLevel = (_currentZoomLevel * details.scale)
                      .clamp(_minAvailableZoom, _maxAvailableZoom);
                  await cameraController!.setZoomLevel(newZoomLevel);
                },
                onScaleEnd: (_) async {
                  _currentZoomLevel = _currentZoomLevel;
                },
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CameraPreview(cameraController!),
                      Positioned(
                        top: 1,
                        left: 1,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.white, width: 2),
                              left: BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 1,
                        right: 1,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.white, width: 2),
                              right: BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        left: 1,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.white, width: 2),
                              left: BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.white, width: 2),
                              right: BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('SQUARE', style: AppTextTheme.bodyGrey13F10),
                SizedBox(width: 22),
                Text('PHOTO', style: AppTextTheme.bodyWhite13F10),
                SizedBox(width: 22),
                Text('VIDEO', style: AppTextTheme.bodyGrey13F10),
                SizedBox(width: 7),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.imagepic, scale: 1.9),
                  SizedBox(width: 34),
                  InkWell(
                    splashColor: Colors.transparent, // removes ripple color
                    highlightColor: Colors.transparent,
                    child: Image.asset(AppAssets.multisnap, scale: 2.1),

                    onTap: () async {
                      if (capturedImages.length >= 10) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "You can only capture up to 10 photos",
                            ),
                          ),
                        );
                        return;
                      }

                      try {
                        XFile picture = await cameraController!.takePicture();
                        setState(() {
                          capturedImages.add(picture);
                        });
                      } catch (e) {
                        print("Error capturing image: $e");
                      }
                    },
                  ),

                  const SizedBox(width: 34),

                  InkWell(
                    splashColor: Colors.transparent, // removes ripple color
                    highlightColor: Colors.transparent,
                    onTap: toggleFlashlight,
                    child: Image.asset(AppAssets.flesh, scale: 1.9),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "${capturedImages.length}/10",
                style: AppTextTheme.textGrey14,
              ),
            ),

            if (capturedImages.isNotEmpty)
              Container(
                height: 50,

                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 22,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: capturedImages.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        AppRouterGo.push(
                          photopreviewScreen, // route name
                          extra: {
                            'selected': capturedImages[index], // tapped image
                            'all': capturedImages, // full list
                            // tapped image index
                          },
                        );
                      },

                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          height: 15,
                          width: 39,
                          clipBehavior: Clip.hardEdge,
                          child: Image.file(
                            File(capturedImages[index].path),

                            fit: BoxFit.cover,
                            cacheWidth: 800,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _setupCameraController() async {
    List<CameraDescription> available = await availableCameras();
    if (available.isNotEmpty) {
      if (mounted) {
        setState(() {
          cameras = available;
          cameraController = CameraController(
            cameras[selectedCameraIndex],
            ResolutionPreset.high,
          );
        });
      }

      cameraController
          ?.initialize()
          .then((_) async {
            if (!mounted) return;
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
        setState(() => _isFlashOn = true);
      } else {
        await cameraController!.setFlashMode(FlashMode.off);
        setState(() => _isFlashOn = false);
      }
    }
  }
}
