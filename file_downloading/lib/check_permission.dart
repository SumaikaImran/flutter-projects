// import 'package:permission_handler/permission_handler.dart';

// class CheckPermission {
//   isStoragePermission() async {
//     var isStorage = await Permission.storage.status;

//     if (!isStorage.isGranted) {
//       await Permission.storage.request();

//       if (!isStorage.isGranted) {
//         return false;
//       } else {
//         return true;
//       }
//     } else {
//       return true;
//     }
//   }
// }
import 'package:permission_handler/permission_handler.dart';

class CheckPermission {
  Future<bool> isStoragePermission() async {
    if (await Permission.manageExternalStorage.isGranted ||
        await Permission.storage.isGranted) {
      return true;
    }

    if (await Permission.manageExternalStorage.isDenied) {
      var status = await Permission.manageExternalStorage.request();
      return status.isGranted;
    }

    if (await Permission.storage.isDenied) {
      var status = await Permission.storage.request();
      return status.isGranted;
    }

    return false;
  }
}
