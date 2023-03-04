import 'package:delivery/domain/repository/iapi_repository.dart';
import 'package:delivery/domain/repository/Ilocal_storage_repository.dart';
import 'package:flutter/material.dart';

class SplashBloc extends ChangeNotifier{

  final ILocalRepository localRepository;
  final IApiRepository apiRepository;

  SplashBloc({
    required this.localRepository,
    required this.apiRepository,
  });

  // void validateTheme()async{
  //   final isDark  = await localRepository.isDarkMode();
  //   if( isDark != ){
  //   }
  // }

  Future<bool> validateSesion()async{
    final token =  await localRepository.getToken();
    if( token != '' ){
      final user = await apiRepository.getUserFromToken(token);
      await localRepository.saveUser(user);
      return true;
    }else{
      return false;
    }
  }

}