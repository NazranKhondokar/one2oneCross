import 'package:dio/dio.dart';
import 'package:one2one/models/login_info.dart';
import 'package:one2one/models/user_info.dart';

import 'logging.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl:
          'http://one2one-env.eba-ewgtd5hj.us-east-2.elasticbeanstalk.com/api/v1',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  )..interceptors.add(Logging());

  Future<UserInfo?> loginUser({required LoginInfo loginInfo}) async {
    UserInfo? retrievedUser;

    try {
      Response response = await _dio.post(
        '/auth/login',
        data: loginInfo.toJson(),
      );

      print('User logged in: ${response.data}');

      retrievedUser = UserInfo.fromJson(response.data);
    } catch (e) {
      print('Error logged in: $e');
    }

    return retrievedUser;
  }
}
