import 'package:delivery/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:delivery/domain/repository/ilocal_storage_repository.dart';

class LocalRepository extends ILocalRepository{

  final _token     = "token";
  final _name      = "name";
  final _username  = "username";
  final _image     = "image";
  final String _darkTheme = "dark-theme";

  @override
  Future<bool> clearAllData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final state = preferences.clear();
    return state;
  }

  @override
  Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString(_token);
    return token ?? '';
  }

  @override
  Future<String> saveToken( String token ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(_token, token);
    return token;
  }

  @override
  Future<User> getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final user = User(
      name:     preferences.getString('name') ?? '', 
      username: preferences.getString('username') ?? '',
      image:    preferences.getString('image') ?? ''
    );
    return user;
  }

  @override
  Future<User> saveUser(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(_name, user.name);
    preferences.setString(_username, user.username);
    preferences.setString(_image, user.image ?? '');
    return user;
  }

  @override
  Future<bool> isDarkMode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final dark = preferences.getBool(_darkTheme);
    return dark ?? false; 
  }

  @override
  Future<bool> saveDarkMode(bool darkMode) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final state = preferences.setBool(_darkTheme, darkMode);
    return state ;
  }

}