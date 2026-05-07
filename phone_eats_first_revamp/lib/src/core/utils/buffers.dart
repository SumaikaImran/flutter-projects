import 'package:phone_eats_first/src/core/exceptions/exceptions.dart';
import 'package:phone_eats_first/src/core/utils/app_exports.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/utils/app_logger.dart';
import 'package:phone_eats_first/src/core/utils/app_prompts.dart';

// mixin Bufferss on ChangeNotifier{}
// here we use on because changeNotifier is already mixin
mixin Buffers on ChangeNotifier {
  List<String> buffers = [];

  addLoader(String id) {
    buffers.add(id);
    debugPrint('Buffer added: $id');
    notifyListeners();
  }

  removeLoader(String id) {
    buffers.remove(id);
    debugPrint('Buffer remove: $id');
    notifyListeners();
  }

  bool hasLoader(String id) {
    return buffers.contains(id);
  }

  @protected
  Future<void> executeAPI({
    bool isAuth = false,
    bool onUnAuthPrompt = false,
    bool showPromt = true,
    required String apiEndPoint,
    required Future<void> Function() onSuccess,
    Future<void> Function(Object)? onError,
    Future<void> Function()? onFinally,
  }) async {
    if (hasLoader(apiEndPoint)) return;
    try {
      addLoader(apiEndPoint);
      await onSuccess();
    } on UnAuthException catch (e) {
      if (!isAuth) {
        // Todo: Implement Logout
        // AuthHandler.ref.logout();
      }
      if (onUnAuthPrompt) {
        Prompts.showSnackBar(e.toString(), color: AppColors.eventRed);
      }
    } catch (e, stackTrace) {
      appPrint('[Error]: ${e.runtimeType}\n');
      appPrint('[Error-StackTrace]: $stackTrace');
      if (showPromt) {
        Prompts.showSnackBar(e.toString(), color: AppColors.eventRed);
      }
      await onError?.call(e);
    } finally {
      removeLoader(apiEndPoint);
      await onFinally?.call();
    }
  }
}
