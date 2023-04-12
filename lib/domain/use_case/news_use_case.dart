
import '../entities/list_news/list_news_model.dart';
import '../repositories/news_repository.dart';

class NewsUseCase{
  final NewsRepository _newsRepository;
  NewsUseCase(this._newsRepository);

  Future<SourceAppModel>call({required String category}){
    return _newsRepository.getNewsRes(category: category);
  }
}