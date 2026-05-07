import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';

class VideoCaching extends StatefulWidget {
  final String src;
  final Map<String, Duration> videoPositions;
  const VideoCaching({
    required this.src,
    required this.videoPositions,
    super.key,
  });

  @override
  State<VideoCaching> createState() => _VideoCachingState();
}

class _VideoCachingState extends State<VideoCaching> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  late Duration startFrom;
  @override
  void initState() {
    super.initState();
    startFrom = widget.videoPositions[widget.src] ?? Duration.zero;
    initializePlayer(widget.src);
  }

  Future<void> initializePlayer(String url) async {
    final fileInfo = await checkCacheFor(url);
    if (fileInfo == null) {
      try {
        _videoPlayerController = VideoPlayerController.networkUrl(
          Uri.parse(widget.src),
        );
        await _videoPlayerController.initialize();
        await _videoPlayerController.seekTo(startFrom);
        if (!mounted) return;

        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          autoPlay: true,
          looping: true,

          showControls: true,
          pauseOnBackgroundTap: true,
          allowFullScreen: true,
          aspectRatio: MediaQuery.of(context).size.aspectRatio,
        );
        cachedForUrl(url);
        setState(() {});
      } catch (e) {
        print(' Error initializing video player: $e');
      }
    } else {
      final file = fileInfo.file;
      _videoPlayerController = VideoPlayerController.file(file);
      await _videoPlayerController.initialize();
      if (!mounted) return;
      Duration startFrom = widget.videoPositions[widget.src] ?? Duration.zero;
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true,
        showControls: true,
        startAt: startFrom,
        autoInitialize: true,
        pauseOnBackgroundTap: true,
        allowFullScreen: true,
        aspectRatio: MediaQuery.of(context).size.aspectRatio,
      );

      setState(() {});
    }
  }

  Future<FileInfo?> checkCacheFor(String url) async {
    final FileInfo? value = await DefaultCacheManager().getFileFromCache(url);
    return value;
  }

  void cachedForUrl(String url) async {
    await DefaultCacheManager().getSingleFile(url).then((value) {
      print('downloaded successfully done for $url');
    });
  }

  @override
  void dispose() {
    // Save current position
    if (_videoPlayerController.value.isInitialized) {
      widget.videoPositions[widget.src] = _videoPlayerController.value.position;
    }
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:
            _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(controller: _chewieController!)
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading....'),
                ],
              ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//   final List<String> videos = [
//      'https://media.istockphoto.com/id/864526000/video/aerial-calm-surface-of-a-lake-in-the-forest-reflecting-the-beautiful-mount-hood-in-the.mp4?s=mp4-640x640-is&k=20&c=FEo1YeJ6ysV5vz62TCXehtl9Di8o0p0nWHPPXbdepFo=',
//     'https://media.istockphoto.com/id/1430945266/video/nature-sunrise-mountain-trees-and-aerial-view-of-the-forrest-and-beautiful-scenic-in-the.mp4?s=mp4-640x640-is&k=20&c=gosr3IBQvn0OV-RLrkaWEzLBeCulQ4QZILC4M5B9DcY=',
//     'https://media.istockphoto.com/id/1198474553/video/landscape-at-snowdonia-national-park-in-wales-uk-crane-shot.mp4?s=mp4-640x640-is&k=20&c=cMhMPgAPc9vU52PWxWxNxgnR0zAXOMabqk1Df4qyj7s=',
//     'https://media.istockphoto.com/id/1430945266/video/nature-sunrise-mountain-trees-and-aerial-view-of-the-forrest-and-beautiful-scenic-in-the.mp4?s=mp4-640x640-is&k=20&c=gosr3IBQvn0OV-RLrkaWEzLBeCulQ4QZILC4M5B9DcY=',
//     'https://media.istockphoto.com/id/1198474553/video/landscape-at-snowdonia-national-park-in-wales-uk-crane-shot.mp4?s=mp4-640x640-is&k=20&c=cMhMPgAPc9vU52PWxWxNxgnR0zAXOMabqk1Df4qyj7s=',
//     'https://media.istockphoto.com/id/699620004/video/landscape-of-clear-stream.mp4?s=mp4-640x640-is&k=20&c=U_MzUJ7sW9OaNgASXb13DJot7zT9x0mGDrrxkLcpO_g=',
//     'https://media.istockphoto.com/id/1457945028/video/woman-hiking-in-norwegian-mountains.mp4?s=mp4-640x640-is&k=20&c=eFTd788iH1aK7KlD-rywvqTAzK59MS_ljcwTAKjaQag=',
//     'https://media.istockphoto.com/id/1413729919/video/panoramic-aerial-drone-flight-video-around-trekker-on-green-hill-with-beautiful-sunset-scene.mp4?s=mp4-640x640-is&k=20&c=aiWBZnEAcgPzCgeaylUWpvCKjmmoAcrfQlTY2IIIWQg=',
//     'https://media.istockphoto.com/id/1125217870/video/time-lapse-sunrise-over-mountain-with-mist-and-fog-cloud.mp4?s=mp4-640x640-is&k=20&c=gJhYDCEdJQXa1OobqkcK995cZhpIWUcgQwJlKUxEHNs=',
//     'https://media.istockphoto.com/id/1317625168/video/4k-video-footage-of-beautiful-lush-green-mountains.mp4?s=mp4-640x640-is&k=20&c=TYfRL-m2MY6PJN8R6H_pbsB0hgJGbwOf8nzSFSnIbtU=',
//     'https://media.istockphoto.com/id/1399092574/video/adventurous-woman-on-a-rocky-mountain-overlooking-ocean-coast.mp4?s=mp4-640x640-is&k=20&c=xqpqkkQgwjJvb3IXekuXSOYa-ajiNW_eFZFIT1vkFHY=',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           child: Stack(
//             children: [
//               Swiper(
//                 itemBuilder: (BuildContext contex, int index) {
//                   return VideoCaching(src: videos[index]);
//                 },
//                 itemCount: videos.length,
//                 scrollDirection: Axis.vertical,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
