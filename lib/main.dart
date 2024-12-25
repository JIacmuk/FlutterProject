import 'package:flop/presentation/features/home/bloc/home_bloc.dart';
import 'package:flop/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flop/data/repositoryImpl/factRepositoryImplementation.dart';

void main() async {

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(ImplFactsRepository()),
        ),
        // Другие блоки при необходимости
      ],
      child: NewsBriefApp(),
    ),
  );
}

class NewsBriefApp extends StatelessWidget {
  const NewsBriefApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Floppas',
      theme: AppTheme.lightTheme,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}