
import 'package:flop/domain/entity/article.dart';
import '../repositoryInterface/factRepositoryInterface.dart';

class GetAllFactsUseCase {
  final IFactRepository _repository;

  GetAllFactsUseCase({
    required IFactRepository repository,
  }) : _repository = repository;

  Future <List<Article>> execute() async {
    final list = await _repository.getAllFacts();
    return list;
  }
}