import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:share_plus/share_plus.dart';
import 'package:dio/dio.dart';
import 'package:file_downloading/check_permission.dart';
import 'package:file_downloading/directory_path.dart';
import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

class FileList extends StatefulWidget {
  FileList({super.key});

  @override
  State<FileList> createState() => _FileListState();
}

class _FileListState extends State<FileList> {
  bool isPermission = false;
  var checkAllPermissions = CheckPermission();
  checkPermission() async {
    var permission = await checkAllPermissions.isStoragePermission();
    if (permission) {
      setState(() {
        isPermission = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    checkAllPermissions;
  }

  var dataList = [
    {
      "id": "1",
      "title": "file IMG  1",
      "url":
          "https://freenaturestock.com/wp-content/uploads/freenaturestock-2321-768x512.jpg",
    },
    {
      "id": "2",
      "title": "file Video 1",
      "url":
          "https://cdn.pixabay.com/video/2020/09/02/48873-457671829_large.mp4",
    },
    {
      "id": "3",
      "title": "file Video 2",
      "url": "https://cdn.pixabay.com/video/2024/08/16/226795_large.mp4",
    },
    {
      "id": "4",
      "title": "file PDF 1",
      "url": "https://cfm.ehu.es/ricardo/docs/python/Learning_Python.pdf",
    },
    {
      "id": "5",
      "title": "file PDF 2",
      "url":
          "https://assets.openstax.org/oscms-prodcms/media/documents/Introduction_to_Python_Programming_-_WEB.pdf",
    },
    {
      "id": "6",
      "title": "file IMG 2",
      "url":
          "https://freenaturestock.com/wp-content/uploads/freenaturestock-2322-1024x683.jpg",
    },
    {
      "id": "7",
      "title": "file IMG 3",
      "url":
          "https://freenaturestock.com/wp-content/uploads/freenaturestock-2285-768x1152.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('file downloading'),
        backgroundColor: Colors.green,
      ),
      body: isPermission
          ? ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (BuildContext context, int index) {
                var data = dataList[index];
                return TileList(fileUrl: data['url']!, title: data['title']!);
              },
            )
          : TextButton(
              onPressed: () {
                checkPermission();
              },
              child: Center(child: Text('Permission issue')),
            ),
    );
  }
}

class TileList extends StatefulWidget {
  const TileList({super.key, required this.fileUrl, required this.title});
  final String fileUrl;
  final String title;

  @override
  State<TileList> createState() => _TileListState();
}

class _TileListState extends State<TileList> {
  bool downloading = false;
  bool fileExists = false;
  double progress = 0;
  late String filePath;
  String fileName = '';
  var getPathFile = DirectoryPath();
  late CancelToken cancelToken;

  startDownload() async {
    cancelToken = CancelToken();
    var storePath = await getPathFile.getPath();
    filePath = '$storePath/$fileName';
    try {
      setState(() {
        downloading = true;
        progress = 0.0;
      });
      await Dio().download(
        widget.fileUrl,
        filePath,
        onReceiveProgress: (count, total) {
          setState(() {
            progress = (count / total);
          });
        },
        cancelToken: cancelToken,
      );
      setState(() {
        downloading = false;
        fileExists = true;
      });
    } catch (e) {
      setState(() {
        downloading = false;
      });
    }
  }

  cancelDownloading() {
    cancelToken.cancel();
    setState(() {
      downloading = false;
    });
  }

  checkFileExists() async {
    var storePath = await getPathFile.getPath();
    filePath = '$storePath/$fileName';
    bool fileExistsCheck = await File(filePath).exists();
    setState(() {
      fileExists = fileExistsCheck;
    });
  }

  // shareFile() async {

  //   final params = ShareParams(files: [XFile('$filePath')]);
  //   final result = await SharePlus.instance.share(params);

  //   if (result.status == ShareResultStatus.dismissed) {
  //     print('Did you not like the pictures?');
  //   }
  // }
  Future<void> shareFile(String filePath) async {
    final XFile file = XFile(filePath);

    try {
      await Share.shareXFiles([file], text: 'Check this out!');
    } catch (e) {
      print('Error while sharing file: $e');
    }
  }

  openFile() {
    OpenFile.open(filePath);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fileName = Path.basename(widget.fileUrl);
    });
    checkFileExists();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey.shade100,
      elevation: 4,
      child: ListTile(
        title: Text(widget.title),

        leading: IconButton(
          onPressed: () {
            fileExists && downloading == false
                ? openFile()
                : downloading
                ? cancelDownloading()
                : null;
          },
          icon: fileExists && downloading == false
              ? Icon(Icons.window, color: Colors.green)
              : Icon(Icons.close),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                fileExists && !downloading ? shareFile(filePath) : null;
              },
              icon: Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {
                fileExists && !downloading ? openFile() : startDownload();
              },
              icon: fileExists
                  ? Icon(Icons.save, color: Colors.green)
                  : downloading
                  ? SizedBox(
                      height: 24,
                      width: 24,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: progress,
                            strokeWidth: 3,
                            backgroundColor: Colors.grey,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.blue,
                            ),
                          ),
                          Text(
                            "${(progress * 100).toStringAsFixed(0)}%",
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Icon(Icons.download),
            ),
          ],
        ),
      ),
    );
  }
}
