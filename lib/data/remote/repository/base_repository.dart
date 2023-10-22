import 'dart:convert';

import 'package:http/http.dart' show Response, StreamedResponse;
import 'package:multiple_result/multiple_result.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../domain/model/session_manager.dart';
import '../../../domain/api/api_service.dart';
import '../../../utils/internet_util.dart';

const TokenExpired = "Token expired";
mixin BaseRepository {
  final _sessionManager = locator<SessionManager>();
  final ApiService _apiService = locator<ApiService>();

  SessionManager get sessionManager => _sessionManager;
  ApiService get apiService => _apiService;

  Future<Result<dynamic, Exception>> processRequest(Function request) async {
    if (await InternetUtil.isConnected()) {
      try {
        var response = (await request()) as Response;
        getLogger("BaseRepository")
            .i("response status code : ${response.statusCode}");

        var responseBody = response.body;

        final dynamic decodedResponseBody = jsonDecode(responseBody);
        if (response.statusCode >= 400 ||
            decodedResponseBody['success'].toString() == 'false') {
          return Error(Exception(parseErrors(decodedResponseBody)));
        }
        getLogger("BaseRepository")
            .i(decodedResponseBody['data']);
        return Success(decodedResponseBody['data']);
      } catch (e) {
        getLogger("Error").e("$e");
        return Error(Exception(parseErrors(e.toString())));
      }
    } else {
      //_toastService.showToast('No internet connection available');
      getLogger("BaseRepository").i('No internet connection available');
      return Error(Exception('No internet connection available'));
    }
  }

  Future<bool> processMultiPartRequest(Function request) async {
    if (await InternetUtil.isConnected()) {
      try {
        var streamedResponse = (await request());
        final response = await Response.fromStream(streamedResponse);
        var data = json.decode(response.body);

        getLogger("BaseRepository")
            .i("response status code : ${response.statusCode}");
        getLogger("BaseRepository").i("response body : $data");
        var statusCode = response.statusCode;
        if (statusCode >= 400) {
          return false;
        }
        return statusCode == 200;
      } catch (e) {
        getLogger("BaseRepositoryHa").e("$e");
        rethrow;
      }
    } else {
      getLogger("BaseRepository").i('No internet connection available');
      throw Exception('No internet connection available');
    }
  }

  String parseErrors(dynamic errorResponse) {
    if (errorResponse is List<dynamic>) {
      return errorResponse
          .fold('', (previousValue, element) => '$previousValue$element\n')
          .trim();
    }
    //{non_field_errors: [Unable to log in with provided credentials.]}
    getLogger("BaseRepository parseErrors").e('$errorResponse');

    if (errorResponse is Map<String, dynamic> &&
        errorResponse.containsKey("message")) {
      return (errorResponse["message"] as dynamic);
    }
    return errorResponse.toString();
  }
}
