import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:khelwa/core/errors/exceptions.dart';
import 'package:khelwa/core/network/message_model.dart';
import 'package:khelwa/screens/splash/data/onboarding_model.dart';
import 'package:khelwa/services/api_constants.dart';
import 'package:khelwa/services/base_api_service.dart';
import 'package:logging/logging.dart';
import 'package:get/get.dart' as gett;

final class ApiService implements BaseApiService {
  late final Dio _dioBackEnd;
  late final Logger _log;
  late final String _baseEndpoint;

  ApiService() {
    _log = Logger('BackendApiService');
    _baseEndpoint = ApiConstante.baseUrlApi;
  }

  @override
  Future<void> initBaseApiService() async {
    _log.config('[BackendApiService] Backend initialized 🍊');
    _dioBackEnd = Dio();
    _dioBackEnd.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint("authorization: ${ApiConstante.token}");
          if (ApiConstante.token != null) {
            options.headers.addAll({'Authorization': ApiConstante.token});
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          debugPrint(
              'ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}');
          return handler.next(error);
        },
      ),
    );
    _dioBackEnd
      ..options.connectTimeout = const Duration(seconds: 10)
      ..options.receiveTimeout = const Duration(seconds: 10)
      ..options.baseUrl = _baseEndpoint
      ..options.headers = {
        'Content-Type': 'application/json',
        "Accept": "application/json",
      };
  }

  @override
  Future<List<OnBoardingModel>> getOnBoarding() async {
    try {
      final Response response = await _dioBackEnd.get(ApiConstante.onBoarding);
      if (response.data['status']) {
        List<OnBoardingModel> onBoardingList = [];
        response.data['splashes'].forEach(
            (item) => onBoardingList.add(OnBoardingModel.fromJson(item)));
        return onBoardingList;
      }
      throw ServerException(
        errorMessageModel: MessageModel.fromJson(response.data),
      );
    } on ServerException catch (e) {
      throw ServerException(
        errorMessageModel: MessageModel(
          number: e.errorMessageModel.number,
          message: e.errorMessageModel.message.tr,
          status: e.errorMessageModel.status,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException(
        errorMessageModel: MessageModel(
          number: '500',
          message: 'server_error'.tr,
          status: false,
        ),
      );
    }
  }

  // @override
  // Future<User> login(LoginRequestBody loginRequestBody) async {
  //   try {
  //     final Response response = await _dioBackEnd.post(
  //       ApiConstante.login,
  //       data: loginRequestBody.toJson(),
  //     );
  //     if (!response.data['status']) {
  //       throw ServerException(
  //         errorMessageModel: MessageModel.fromJson(response.data),
  //       );
  //     }
  //     final User user;
  //     final bool isActivated = response.data['data']['isActive'] as bool;
  //     if (isActivated) {
  //       user = User.fromJson(response.data['data']['user']);
  //       user.isActivated = isActivated;
  //     } else {
  //       user = User.fromOtpJson(response.data['data']);
  //       user.message = response.data['message'];
  //     }
  //     return user;
  //   } on ServerException catch (e) {
  //     throw ServerException(
  //       errorMessageModel: MessageModel(
  //         number: e.errorMessageModel.number,
  //         message: e.errorMessageModel.message.tr,
  //         status: e.errorMessageModel.status,
  //       ),
  //     );
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     throw ServerException(
  //       errorMessageModel: MessageModel(
  //         number: '500',
  //         message: 'server_error'.tr,
  //         status: false,
  //       ),
  //     );
  //   }
  // }
}
