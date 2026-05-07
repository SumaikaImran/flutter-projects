import 'package:phone_eats_first/src/core/services/network_service/entities/file_entity.dart';
import 'package:phone_eats_first/src/core/services/network_service/entities/loader_entity.dart';


abstract interface class BaseApiService {
  Future requestGET({
    required ApiRouteEntity apiRoute,
    required Map<String, String>? headers,
  });

  Future requestPOST({
    required ApiRouteEntity apiRoute,
    Object? data,
    Map<String, String>? headers,
  });

  Future requestPUT({
    required ApiRouteEntity apiRoute,
    Object? data,
    required Map<String, String>? headers,
  });

  Future requestDELETE({
    required ApiRouteEntity apiRoute,
    Object? data,
    required Map<String, String>? headers,
  });

  Future requestMultiPartPOST({
    required List<FileEntity> files,
    required ApiRouteEntity apiRoute,
    Map<String, String>? data,
    required Map<String, String> headers,
  });
}
