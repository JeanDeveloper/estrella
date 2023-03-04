import 'package:delivery/domain/entities/user.dart';
import 'package:delivery/domain/request/login_request.dart';
import 'package:delivery/domain/response/login_response.dart';

abstract class IApiRepository{
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest login);  
  Future<void> logout(String token);
}