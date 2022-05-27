import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:one2one/dashboard/dashboard_screen.dart';
import 'package:one2one/models/login_info.dart';
import 'package:one2one/models/user_info.dart';
import 'package:one2one/utils/dio_client.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);
  final DioClient _dioClient = DioClient();

  Future<String?> _authUser(LoginData data) async {
    LoginInfo loginInfo = LoginInfo();
    loginInfo.mobileOrEmail = data.name;
    loginInfo.password = data.password;

    debugPrint(
        'Name: ${loginInfo.mobileOrEmail}, Password: ${loginInfo.password}');
    UserInfo? retrievedUser = await _dioClient.loginUser(loginInfo: loginInfo);
    // if (retrievedUser != null) return retrievedUser.status;
    return null;
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'One2One',
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardScreen(title: 'one2one'),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}