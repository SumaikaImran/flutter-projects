import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photofilters/photofilters.dart';
import 'package:image/image.dart' as imageLib;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class PhotoFilter extends StatefulWidget {
  const PhotoFilter({Key? key}) : super(key: key);

  @override
  State<PhotoFilter> createState() => _PhotoFilterState();
}

class _PhotoFilterState extends State<PhotoFilter> {
  late String fileName;
  File? imageFile;
  final List<Filter> filters = presetFiltersList;

  Future<void> getImage(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile == null) return;

    imageFile = File(pickedFile.path);
    fileName = basename(imageFile!.path);

    var image = imageLib.decodeImage(await imageFile!.readAsBytes());

    final Map? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoFilterSelector(
          title: const Text("Apply Filter"),
          image: image!,
          filters: filters,
          filename: fileName,
          loader: const Center(child: CircularProgressIndicator()),
          fit: BoxFit.contain,
        ),
      ),
    );

    if (result != null && result.containsKey('image_filtered')) {
      setState(() {
        imageFile = result['image_filtered'];
      });
      print("Filtered Image Path: ${imageFile!.path}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Photo Filter App")),
      body: Center(
        child: imageFile != null
            ? Image.file(imageFile!)
            : const Text("No image selected."),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async => await getImage(context),
        label: const Text('Pick Image'),
        icon: const Icon(Icons.image),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
