import 'dart:convert';

import 'package:jolly_podcast_test/models/default_response_model.dart';
import 'package:jolly_podcast_test/networks/api_manager.dart';
import 'package:jolly_podcast_test/networks/app_network_url.dart';
import 'package:jolly_podcast_test/utils/app_helpers.dart';
import 'dart:developer' as developer;
class AuthHttpsRepository extends ApiManager {
  AuthHttpsRepository() : super(baseUrl: AppNetworkUrl.baseStUrl);

  final _excecptionCode = AppHelpers.exceptionCode;
  final _errorCode = AppHelpers.exceptionCode;
  final _parsingError = AppHelpers.parsingError;

  static const String _getAllPodcasts = '/api/podcasts/top-jolly?';
  static const String _trendingPodcast = '/api/episodes/trending?';
  static const String _login = '/api/auth/login';

  Future<DefaultResModel> getAllPodcasts({
    required int page,
    required int per_page,
  }) async {

    print("_getAllPodcasts url ${_getAllPodcasts}page=${page}&per_page=${per_page}");

    try {

      final response = await getHttp("${_getAllPodcasts}page=${page}&per_page=${per_page}");

      if (response.data != null) {

        if (response.data is Map<String, dynamic>) {

          final Map<String, dynamic> responseDataMap = response.data;
          final bool isSuccess = responseDataMap['success'] ?? false;
          final String message = responseDataMap['message'] ?? "No message found";
          final dynamic data = responseDataMap['data'];

          return DefaultResModel.fromJson({
            "code": "00",
            "success": isSuccess,
            "message": message,
            "data": data
          });

        } else {

          developer.log('API Response was not a Map, but a ${response.data.runtimeType}', name: 'API_ERROR', level: 0);
          Map valueMap = jsonDecode(response.data);
          return DefaultResModel(
            code: _errorCode,
            success: false,
            message: valueMap["message"],
            // message: "Received an unexpected response format from the server.",
            data: null,
          );

        }

      } else {

        return DefaultResModel(
          code: _errorCode,
          success: false,
          message: response.responseCodeError!,
        );

      }
    } catch (e) {

      developer.log('An exception occurred in login: $e', name: 'API_EXCEPTION', level: 0);
      return DefaultResModel(
          code: _excecptionCode,
          success: false,
          message: _parsingError,
          data: null
      );

    }

  }

  Future<DefaultResModel> trendingPodcast({
    required int page,
    required int per_page,
  }) async {

    print("_trendingPodcast url ${_trendingPodcast}page=${page}&per_page=${per_page}");

    try {

      final response = await getHttp("${_trendingPodcast}page=${page}&per_page=${per_page}");

      if (response.data != null) {

        if (response.data is Map<String, dynamic>) {

          final Map<String, dynamic> responseDataMap = response.data;
          final bool isSuccess = responseDataMap['success'] ?? false;
          final String message = responseDataMap['message'] ?? "No message found";
          final dynamic data = responseDataMap['data'];

          return DefaultResModel.fromJson({
            "code": "00",
            "success": isSuccess,
            "message": message,
            "data": data
          });

        } else {

          developer.log('API Response was not a Map, but a ${response.data.runtimeType}', name: 'API_ERROR', level: 0);
          Map valueMap = jsonDecode(response.data);
          return DefaultResModel(
            code: _errorCode,
            success: false,
            message: valueMap["message"],
            // message: "Received an unexpected response format from the server.",
            data: null,
          );

        }

      } else {

        return DefaultResModel(
          code: _errorCode,
          success: false,
          message: response.responseCodeError!,
        );

      }
    } catch (e) {

      developer.log('An exception occurred in login: $e', name: 'API_EXCEPTION', level: 0);
      return DefaultResModel(
          code: _excecptionCode,
          success: false,
          message: _parsingError,
          data: null
      );

    }

  }


  Future<DefaultResModel> login({
    required String phoneNumber,
    required String password,
  }) async {

    final Map<String, String> body = {
      "phone_number": phoneNumber,
      "password": password,
    };
    developer.log('API Request Body: ${body}', name: 'API_CALL BODY', level: 0);
    print("_login url ${AppNetworkUrl.baseStUrl}${_login}");

    try {

      final response = await postHttp("${_login}", body);

      if (response.data != null) {

        if (response.data is Map<String, dynamic>) {

          final Map<String, dynamic> responseDataMap = response.data;
          final bool isSuccess = responseDataMap['success'] ?? false;
          final String message = responseDataMap['message'] ?? "No message found";
          final dynamic data = responseDataMap['data'];

          return DefaultResModel.fromJson({
            "code": "00",
            "success": isSuccess,
            "message": message,
            "data": data
          });

        } else {

          developer.log('API Response was not a Map, but a ${response.data.runtimeType}', name: 'API_ERROR', level: 0);
          Map valueMap = jsonDecode(response.data);
          return DefaultResModel(
            code: _errorCode,
            success: false,
            message: valueMap["message"],
            // message: "Received an unexpected response format from the server.",
            data: null,
          );

        }

      } else {

        return DefaultResModel(
            code: _errorCode,
            success: false,
            message: response.responseCodeError!,
            data: null
        );

      }

    } catch (e) {
      developer.log('An exception occurred in login: $e', name: 'API_EXCEPTION', level: 0);
      return DefaultResModel(
          code: _excecptionCode,
          success: false,
          message: _parsingError,
          data: null
      );

    }

  }




}