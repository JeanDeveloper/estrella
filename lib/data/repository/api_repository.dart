import 'package:delivery/domain/entities/user.dart';
import 'package:delivery/domain/exception/auth_exception.dart';
import 'package:delivery/domain/repository/iapi_repository.dart';
import 'package:delivery/domain/response/login_response.dart';
import 'package:delivery/domain/request/login_request.dart';

class ApiRepository extends IApiRepository{

  final chungaUser = const  User(
    name: 'Jean Carlo Chunga', 
    username: 'jchunga',
    image: 'https://images.unsplash.com/photo-1611213574794-5e2ea4d6c339?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
  );

  final mejiaUser = const User(
    name: 'Wendy Nicol Mejia', 
    username: 'wmejia',
    image:  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
  );

  @override
  Future<User> getUserFromToken(String token) async {

    await Future.delayed(const Duration(seconds: 3));

    if( token == 'abc123'){
      return chungaUser;
    }else if( token == 'def456' ){
      return mejiaUser;
    }
    throw AuthException();
  }

  @override
  Future<LoginResponse> login( LoginRequest login ) async {
    if( login.username == 'jchunga' && login.password == '123456' ){
      return LoginResponse('abc123', chungaUser);
    }else if( login.username == 'wmejia' && login.password == '123456' ){
      return  LoginResponse('def456', mejiaUser);
    }
    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print("Remove token from server");
  }

}