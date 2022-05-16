import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:mini_project_nft_market/services/api/model/login_request.dart';
import 'package:mini_project_nft_market/services/api/model/login_respond.dart';

class AuthRepository {
  final Dio _dio = Dio();

  Future<Either<String, LoginRespond>> signInUserWithEmailAndPassword(
      {required LoginRequest loginRequest}) async {
    Response _response;
    try {
      _response = await _dio.post("https://reqres.in/api/login",
          data: loginRequest.toJson());
      LoginRespond _loginResp = LoginRespond.fromJson(_response.data);
      return right(_loginResp);
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e.response!.statusCode);
      String errorMessage = e.response!.data.toString();
      switch (e.type) {
        case DioErrorType.connectTimeout:
          break;
        case DioErrorType.sendTimeout:
          break;
        case DioErrorType.receiveTimeout:
          break;
        case DioErrorType.response:
          errorMessage = e.response!.data['error'];
          break;
        case DioErrorType.cancel:
          break;
        case DioErrorType.other:
          break;
      }

      return left(errorMessage);
    }
  }
}
