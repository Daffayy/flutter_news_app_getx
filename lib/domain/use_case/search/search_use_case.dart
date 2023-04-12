
import 'package:flutter_news_app_getx/domain/repositories/search/search_respository.dart';

import '../../entities/category_model/news_app_model.dart';

class SearchUseCase{
final SearchRepository _searchRepository;

  SearchUseCase(this._searchRepository);

  Future<NewsAppModel>call({required String searchParams}){
    return _searchRepository.doGetSearchNews(searchParams: searchParams);
  }
}