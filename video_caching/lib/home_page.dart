import 'package:caching/video_caching.dart';
import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final Map<String, Duration> videoPositions = {}; // <-- Shared map
  final List<String> videos = [
    // 'https://cdn.pixabay.com/video/2020/09/02/48873-457671829_large.mp4'
    'https://media.istockphoto.com/id/864526000/video/aerial-calm-surface-of-a-lake-in-the-forest-reflecting-the-beautiful-mount-hood-in-the.mp4?s=mp4-640x640-is&k=20&c=FEo1YeJ6ysV5vz62TCXehtl9Di8o0p0nWHPPXbdepFo=',
    'https://media.istockphoto.com/id/1430945266/video/nature-sunrise-mountain-trees-and-aerial-view-of-the-forrest-and-beautiful-scenic-in-the.mp4?s=mp4-640x640-is&k=20&c=gosr3IBQvn0OV-RLrkaWEzLBeCulQ4QZILC4M5B9DcY=',
    'https://media.istockphoto.com/id/1198474553/video/landscape-at-snowdonia-national-park-in-wales-uk-crane-shot.mp4?s=mp4-640x640-is&k=20&c=cMhMPgAPc9vU52PWxWxNxgnR0zAXOMabqk1Df4qyj7s=',
    'https://media.istockphoto.com/id/699620004/video/landscape-of-clear-stream.mp4?s=mp4-640x640-is&k=20&c=U_MzUJ7sW9OaNgASXb13DJot7zT9x0mGDrrxkLcpO_g=',
    'https://media.istockphoto.com/id/1457945028/video/woman-hiking-in-norwegian-mountains.mp4?s=mp4-640x640-is&k=20&c=eFTd788iH1aK7KlD-rywvqTAzK59MS_ljcwTAKjaQag=',
    'https://media.istockphoto.com/id/1413729919/video/panoramic-aerial-drone-flight-video-around-trekker-on-green-hill-with-beautiful-sunset-scene.mp4?s=mp4-640x640-is&k=20&c=aiWBZnEAcgPzCgeaylUWpvCKjmmoAcrfQlTY2IIIWQg=',
    'https://media.istockphoto.com/id/1125217870/video/time-lapse-sunrise-over-mountain-with-mist-and-fog-cloud.mp4?s=mp4-640x640-is&k=20&c=gJhYDCEdJQXa1OobqkcK995cZhpIWUcgQwJlKUxEHNs=',
    'https://media.istockphoto.com/id/1317625168/video/4k-video-footage-of-beautiful-lush-green-mountains.mp4?s=mp4-640x640-is&k=20&c=TYfRL-m2MY6PJN8R6H_pbsB0hgJGbwOf8nzSFSnIbtU=',
    'https://media.istockphoto.com/id/1399092574/video/adventurous-woman-on-a-rocky-mountain-overlooking-ocean-coast.mp4?s=mp4-640x640-is&k=20&c=xqpqkkQgwjJvb3IXekuXSOYa-ajiNW_eFZFIT1vkFHY=',
    'https://media.istockphoto.com/id/1430945266/video/nature-sunrise-mountain-trees-and-aerial-view-of-the-forrest-and-beautiful-scenic-in-the.mp4?s=mp4-640x640-is&k=20&c=gosr3IBQvn0OV-RLrkaWEzLBeCulQ4QZILC4M5B9DcY=',
    // 'https://media.istockphoto.com/id/1198474553/video/landscape-at-snowdonia-national-park-in-wales-uk-crane-shot.mp4?s=mp4-640x640-is&k=20&c=cMhMPgAPc9vU52PWxWxNxgnR0zAXOMabqk1Df4qyj7s=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Swiper(
                itemBuilder: (BuildContext contex, int index) {
                  return VideoCaching(
                    src: videos[index],
                    videoPositions: videoPositions,
                  );
                },
                itemCount: videos.length,
                scrollDirection: Axis.vertical,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
