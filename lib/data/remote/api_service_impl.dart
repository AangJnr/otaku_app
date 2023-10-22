import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../domain/api/api_service.dart';
import '../../domain/model/profile/profile.dart';
import '../../domain/model/session_manager.dart';
import '../../domain/model/subscription.dart';
import '../../domain/model/upload_photo_request.dart';
import 'routes.dart';

class ApiServiceImpl implements ApiService {
  final log = getLogger('ApiServiceImpl');

  final _sessionManager = locator<SessionManager>();

  Map<String, String> getHeaders({bool isSecure = false}) {
    final headersMap = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    if (isSecure) {
      headersMap.putIfAbsent(
          'Authorization', () => 'Token ${_sessionManager.getAccessToken()}');
    }
    return headersMap;
  }

  Map<String, String> getMultiPartHeaders() {
    return {
      'Authorization': 'Token ${_sessionManager.getAccessToken()}',
      'Content-type': 'multipart/form-data',
      'Accept': '*/*'
    };
  }

  String toQueryParams(Map<String, dynamic> data) {
    String params = '';

    params += '?';

    data.forEach((k, v) {
      if (v is List) {
        for (var item in v) {
          if (item != null && item.toString().isNotEmpty) {
            params += "$k[]=$item";
          }
        }
      } else {
        if (v != null && v.toString().isNotEmpty) {
          params += "$k=$v";
        }
      }
      params += "&";
    });

    return params.replaceRange(params.length - 1, params.length, '');
  }

  get(url, {required Map<String, String> headers}) {
    log.i("url: $url");
    log.i("headers: $headers");
    return http.get(Uri.parse(url), headers: headers);
  }

  post(url, {required Map<String, String> headers, body}) {
    log.i("url: $url");
    log.i("headers: $headers");
    log.i("body: $body");
    return http.post(Uri.parse(url), headers: headers, body: body);
  }

  delete(url, {required Map<String, String> headers, body}) {
    log.i("url: $url");
    log.i("headers: $headers");
    log.i("body: $body");
    return http.delete(Uri.parse(url), headers: headers, body: body);
  }

  patch(url, {required Map<String, String> headers, body}) {
    log.i("url: $url");
    log.i("headers: $headers");
    log.i("body: $body");
    return http.patch(Uri.parse(url), headers: headers, body: body);
  }

  put(url, {required Map<String, String> headers, body}) {
    log.i("url: $url");
    log.i("headers: $headers");
    log.i("body: $body");
    return http.put(Uri.parse(url), headers: headers, body: body);
  }

  patchMultipart(
    url, {
    required Map<String, String> headers,
    required List<ImageProperties> dataList,
  }) async {
    final request = http.MultipartRequest("PATCH", Uri.parse(url));
    log.i("url: $url");

    request.headers.addAll(headers);
    log.i("headers: ${request.headers}");

    request.files.add(await http.MultipartFile.fromPath(
        dataList.first.key, dataList.first.file.path));

    return request.send();
  }

  postMultipart(
    url, {
    required Map<String, String> headers,
    required List<ImageProperties> dataList,
  }) async {
    final request = http.MultipartRequest("POST", Uri.parse(url));
    log.i("url: $url");

    request.headers.addAll(headers);
    log.i("headers: ${request.headers}");

    request.files.add(await http.MultipartFile.fromPath(
        dataList.last.key, dataList.last.file.path));

    return request.send();
  }

  // @override
  // Future<http.Response> getUser(String uid) {
  //   var response = get(
  //     User().Profile(uid),
  //     headers: getHeaders(isSecure: false),
  //   );
  //   return response;
  // }

  @override
  Future<http.Response> getProfile(String uid) {
    var response =
        get(User().Profile(uid), headers: getHeaders(isSecure: false));
    return response;
  }

  @override
  Future<http.Response> editProfile(String uid, Profile profile) {
    var response = patch(User().Profile(uid),
        headers: getHeaders(isSecure: true), body: profile.mapToApi().toJson());
    return response;
  }

  @override
  Future<http.Response> uploadPhoto(UploadPhotoRequest request) {
    var response = post(User().UploadPhoto,
        headers: getHeaders(isSecure: true), body: request.toJson());
    return response;
  }

  @override
  Future<http.Response> subscribe(SubscriptionRequest subscriptionRequest) {
    var response = post(User().Subscribe,
        headers: getHeaders(isSecure: true),
        body: subscriptionRequest.toRequest());
    return response;
  }

  @override
  Future<http.Response> getCategories() {
    var response = get(
      Admin().Categories,
      headers: getHeaders(isSecure: false),
    );
    return response;
  }

  @override
  Future<http.Response> createUser(SubscriptionRequest subscriptionRequest) {
    var response = post(Auth().SignUp,
        headers: getHeaders(isSecure: false),
        body: subscriptionRequest.toRequest());
    return response;
  }

  @override
  Future<http.Response> activeSubscription() {
    var response =
        get(User().ActiveSubscription, headers: getHeaders(isSecure: true));
    return response;
  }

  @override
  Future<http.Response> login(String email) {
    var response =
        get(Auth().login(email), headers: getHeaders(isSecure: false));
    return response;
  }
}

class ImageProperties {
  String? uuid;
  String key;
  File file;
  ImageProperties(this.key, this.file, {this.uuid = ''});
}
