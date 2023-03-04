import 'package:delivery/domain/entities/user.dart';

abstract class ILocalRepository{

  Future<String> getToken();
  Future<String> saveToken( String token );
  Future<bool> clearAllData();
  Future<User> saveUser(User user);
  Future<User> getUser();
  Future<bool> isDarkMode();
  Future<bool> saveDarkMode(bool darkMode);

}