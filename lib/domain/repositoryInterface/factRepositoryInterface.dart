import 'package:flop/domain/entity/article.dart';

abstract class IFactRepository {
  Future<List<Article>> getAllFacts();
}