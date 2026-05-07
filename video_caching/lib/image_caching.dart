import 'package:caching/video_caching.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageCaching extends StatelessWidget {
  ImageCaching({super.key});
  List image_list = [
    'https://media.istockphoto.com/id/1381637603/photo/mountain-landscape.jpg?s=612x612&w=0&k=20&c=w64j3fW8C96CfYo3kbi386rs_sHH_6BGe8lAAAFS-y4=',
    'https://t4.ftcdn.net/jpg/11/76/97/53/360_F_1176975379_FrR5kyycOvFnIecqYb10ShtDpQbKYEbX.jpg',
    'https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=612x612&w=0&k=20&c=A63koPKaCyIwQWOTFBRWXj_PwCrR4cEoOw2S9Q7yVl8=',
    'https://media.istockphoto.com/id/1550071750/photo/green-tea-tree-leaves-camellia-sinensis-in-organic-farm-sunlight-fresh-young-tender-bud.jpg?s=612x612&w=0&k=20&c=RC_xD5DY5qPH_hpqeOY1g1pM6bJgGJSssWYjVIvvoLw=',
    'https://static8.depositphotos.com/1491329/1068/i/450/depositphotos_10687188-stock-photo-foggy-landscape-early-morning-mist.jpg',
    'https://static.vecteezy.com/system/resources/thumbnails/049/547/664/small/stunning-high-resolution-nature-and-landscape-backgrounds-breathtaking-scenery-in-hd-free-photo.jpg',
    'https://www.shutterstock.com/image-photo/beautiful-vivid-sky-painted-by-600nw-2485011933.jpg',
    'https://thumbs.dreamstime.com/b/sunrise-summer-sky-panorama-sunrise-summer-sky-panorama-art-air-clouds-background-100112523.jpg',
    'https://www.beatingtime.org/wp-content/uploads/2018/11/481711544-612x612.jpg',
    'https://img.freepik.com/free-photo/fuji-mountain-kawaguchiko-lake-sunset-autumn-seasons-fuji-mountain-yamanachi-japan_335224-1.jpg',
    'https://img.freepik.com/premium-photo/fuji-mountain-with-blue-sky-landscape-japan_42957-7545.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cached Network Image'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: 11,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            key: UniqueKey(),
            imageUrl: image_list[index],
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(color: Colors.black12),
            errorWidget: (context, url, error) => Container(
              color: Colors.black12,
              child: const Icon(Icons.error, color: Colors.red, size: 80),
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => VideoCaching()),
      //   ),
      //   child: Row(
      //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     // crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [Text('Next Page'), Icon(Icons.skip_next)],
      //   ),
      // ),
    );
  }
}
