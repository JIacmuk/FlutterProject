import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flop/domain/repositoryInterface/factRepositoryInterface.dart';
import 'package:flop/data/repositoryImpl/factRepositoryImplementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flop/serviceLocator/serviceLocator.dart';


import '../../../../data/repositoryImpl/factRepositoryImplementation.dart';
import '../../../../domain/entity/article.dart';

part "home_event.dart";
part "home_state.dart";

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IFactRepository factRep;
  HomeBloc(this.factRep) : super(HomeInitial()) {
    on<HomeLoad>(_homeLoad);
  }
  Future<void> _homeLoad(HomeLoad event, Emitter<HomeState> emit) async {
    // Если данные уже загружены, не выполняем новый запрос
    if (state is HomeLoadSuccess) {
      return; // Завешаем выполнение, если данные уже загружены
    }

    // Показать индикатор загрузки
    emit(HomeLoadInProgress());

    try {
      final articles = await factRep.getAllFacts();
      emit(HomeLoadSuccess(articles: articles));
    } catch (exception) {
      emit(HomeLoadFailure(exception: exception));
      talker.handle(exception); // Обработка исключений
    } finally {
      event.completer?.complete();
    }
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    talker.handle(error, stackTrace);
  }
}