// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:snapchat/theme/colors.dart';
import 'package:video_player/video_player.dart';

class StoryDetailPage extends StatefulWidget {
  final String videoUrl;

  const StoryDetailPage({super.key, required this.videoUrl});

  @override
  State<StoryDetailPage> createState() => _StoryDetailPageState();
}

class _StoryDetailPageState extends State<StoryDetailPage> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.initialize().then((value) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: VideoPlayer(_controller),
            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [black.withOpacity(0.6), black.withOpacity(0)],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      MaterialIcons.keyboard_arrow_up,
                      size: 28,
                      color: white,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 12,
                          left: 12,
                          top: 8,
                          bottom: 8,
                        ),
                        child: Text(
                          "View More Episodes",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: black.withOpacity(0.2),
                    border: Border.all(color: white.withOpacity(0.2)),
                  ),
                  child: Center(
                    child: Icon(
                      FontAwesome.location_arrow,
                      size: 20,
                      color: white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      backgroundColor: black,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.close, color: white),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(AntDesign.like2, size: 20, color: white),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Entypo.dots_three_vertical, size: 20, color: white),
        ),
      ],
    );
  }
}
