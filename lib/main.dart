//импортируем материалы
import 'package:flutter/material.dart';

//импортируем
import 'package:flop/di/dependencyInjection.dart';
import 'package:flop/flop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  FlutterError.onError = (details) => talker.handle(
    details.exception,
    details.stack,
  );
  runApp(const NewsBriefApp());
}

