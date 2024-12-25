
import 'package:dio/dio.dart';
import 'package:flop/data/apiClient.dart';
import 'package:flop/domain/entity/article.dart';
import 'package:flop/domain/repositoryInterface/factRepositoryInterface.dart';

class ImplFactsRepository implements IFactRepository {
  final ApiClient _api;

  ImplFactsRepository() : _api = ApiClient();

  //временная привязка импементации( так делать не стоит )


  @override
  Future<List<Article>> getAllFacts() {
    return _api.getAllFacts();
  }
}