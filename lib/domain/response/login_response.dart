import 'package:delivery/domain/entities/user.dart';

class LoginResponse{

  LoginResponse(this.token, this.user);
  final String token;
  final User user;

}