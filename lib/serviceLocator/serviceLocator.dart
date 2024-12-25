import 'package:dio/dio.dart';
import 'package:flop/data/dio/setUp.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

//регистрация логгера ошибок(толкер)
final getIt = GetIt.instance;
final talker = TalkerFlutter.init();

//регистрация dio
final Dio dio = Dio();

//регистрация синглтона 
Future<void> setupLocator() async {
  setUpDio();
  getIt.registerSingleton(talker);
}