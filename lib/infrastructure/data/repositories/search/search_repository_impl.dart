
import 'package:flutter_news_app_getx/domain/entities/category_model/news_app_model.dart';
import 'package:flutter_news_app_getx/domain/repositories/search/search_respository.dart';
import 'package:flutter_news_app_getx/infrastructure/data/data_sources/remote/remote_news_data_source.dart';

class SearchRepositoryImpl implements SearchRepository{
  final RemoteNewsDataSource _remoteNewsDataSource;

  SearchRepositoryImpl(this._remoteNewsDataSource);


  @override
  Future<NewsAppModel> doGetSearchNews({required String searchParams}) {
    return _remoteNewsDataSource.doGetSearchNews(searchParams: searchParams);
  }
}