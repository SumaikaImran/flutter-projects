import 'dart:convert';
import 'dart:io';
import 'package:phone_eats_first/src/core/exceptions/exceptions.dart';
import 'package:phone_eats_first/src/core/services/network_service/base_api_service.dart';
import 'package:phone_eats_first/src/core/services/network_service/entities/file_entity.dart';
import 'package:phone_eats_first/src/core/services/network_service/entities/loader_entity.dart';
import 'package:phone_eats_first/src/core/services/network_service/response_handlers_mixin.dart';
import 'package:phone_eats_first/src/core/services/network_service/routes/api_routes.dart';
import 'package:phone_eats_first/src/core/services/registry_service/di.dart';
import 'package:phone_eats_first/src/core/utils/app_logger.dart';
import 'package:http/http.dart';

// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class ApiService with ResponseHandlersMixin implements BaseApiService {
  final _http = locator<Client>();

  @override
  Future requestGET({
    required ApiRouteEntity apiRoute,
    Map<String, String>? headers,
  }) async {
    try {
      String route =
          "${apiRoute.base ?? ApiRoutes.baseUrl}${apiRoute.endpoint}";
      appLog(
        "\n***REQUESTING GET on route***: @$route "
        "\n***Headers: $headers",
      );

      Response response = await _http.get(
        Uri.parse(route),
        headers: headers,
      );

      appLog("\n\n***RAW RESPONSE*** ${response.body} ***\n\n");
      var result = filterResponse(response);

      appPrint("\n\n***FILTERED RESULT*** $result\n\n");
      return result;
    } on SocketException {
      throw NoInternetException();
    } on ClientException {
      throw NoInternetException();
    } catch (e) {
      appPrint("ApiClient e: $e");
      rethrow;
    }
  }

  @override
  Future requestPOST({
    required ApiRouteEntity apiRoute,
    Object? data,
    Map<String, String>? headers,
  }) async {
    try {
      String route =
          "${apiRoute.base ?? ApiRoutes.baseUrl}${apiRoute.endpoint}";
      appLog(
        "\n***REQUESTING***: @$route "
        "\n***Payload:$data"
        "\n***Headers: $headers",
      );

      Response response = await _http.post(
        Uri.parse(route),
        headers: headers,
        body: jsonEncode(data),
      );
      appLog("\n\n***RAW RESPONSE*** ${response.body} ***\n\n");
      var result = filterResponse(response);

      appPrint("\n\n***FILTERED RESULT*** $result\n\n");
      return result;
    } on SocketException {
      throw NoInternetException();
    } on ClientException {
      throw NoInternetException();
    } catch (e) {
      appPrint("ApiClient e: $e");
      rethrow;
    }
  }

  @override
  Future requestPUT({
    required ApiRouteEntity apiRoute,
    Object? data,
    Map<String, String>? headers,
  }) async {
    try {
      String route =
          "${apiRoute.base ?? ApiRoutes.baseUrl}${apiRoute.endpoint}";
      appLog(
        "\n***REQUESTING [PUT]***: @$route "
        "\n***Payload:$data"
        "\n***Headers: $headers",
      );

      Response response = await _http.put(
        Uri.parse(route),
        headers: headers,
        body: jsonEncode(data),
      );
      appLog("\n\n***RAW RESPONSE*** ${response.body} ***\n\n");
      var result = filterResponse(response);

      appPrint("\n\n***FILTERED RESULT*** $result\n\n");
      return result;
    } on SocketException {
      throw NoInternetException();
    } on ClientException {
      throw NoInternetException();
    } catch (e) {
      appPrint("ApiClient e: $e");
      rethrow;
    }
  }

  @override
  Future requestDELETE({
    required ApiRouteEntity apiRoute,
    Object? data,
    Map<String, String>? headers,
  }) async {
    try {
      String route =
          "${apiRoute.base ?? ApiRoutes.baseUrl}${apiRoute.endpoint}";
      appLog(
        "\n***REQUESTING***: @$route "
        "\n***Payload:$data"
        "\n***Headers: $headers",
      );

      Response response = await _http.delete(
        Uri.parse(route),
        headers: headers,
        body: data,
      );
      appLog("\n\n***RAW RESPONSE*** ${response.body} ***\n\n");
      var result = filterResponse(response);

      appPrint("\n\n***FILTERED RESULT*** $result\n\n");
      return result;
    } on SocketException {
      throw NoInternetException();
    } on ClientException {
      throw NoInternetException();
    } catch (e) {
      appPrint("ApiClient e: $e");
      rethrow;
    }
  }

  @override
  Future requestMultiPartPOST({
    required List<FileEntity> files,
    required ApiRouteEntity apiRoute,
    Map<String, String>? data,
    required Map<String, String> headers,
  }) async {
    try {
      String route = "${apiRoute.base}${apiRoute.endpoint}";
      var request = MultipartRequest(
        'POST',
        Uri.parse(route),
      );
      if (data != null) {
        request.fields.addAll(data);
      }
      // appPrint('File Path: $filePath');
      // final mimeType = lookupMimeType(filePath);
      // final mimeTypeData = mimeType?.split('/');
      for (int i = 0; i < files.length; i++) {
        appPrint('File Path: ${files[i].path}');
        final mimeType = lookupMimeType(files[i].path);
        final mimeTypeData = mimeType?.split('/');
        request.files.add(
          await MultipartFile.fromPath(
            files[i].name,
            files[i].path,
            filename: files[i].path.split('/').last,
            contentType: mimeTypeData != null
                ? MediaType(mimeTypeData[0], mimeTypeData[1])
                : null,
          ),
        );
      }
      // request.files.add(
      //   await MultipartFile.fromPath(
      //     fileName ?? 'file',
      //     filePath,
      //     filename: filePath.split('/').last,
      //     contentType: mimeTypeData != null
      //         ? MediaType(mimeTypeData[0], mimeTypeData[1])
      //         : null,
      //   ),
      // );
      appLog('Headers: $headers');
      request.headers.addAll(headers);
      appLog('REQUEST FILENAME: ${request.files.first.filename}');
      appLog(
          'REQUEST FILE CONTENT TYPE: ${request.files.first.contentType.type}');
      appLog('REQUEST FILE FIELDS: ${request.files.first.field}');
      appLog('REQUEST FIELDS: ${request.fields}');
      StreamedResponse response = await request.send();
      var result = filterResponse(response);
      appPrint("\n\n***FILTERED RESULT*** $result\n\n");
      return result;
    } on SocketException {
      throw NoInternetException();
    } catch (e, stackTrace) {
      appPrint('[StackTrace]: $stackTrace');
      rethrow;
    }
  }
}
