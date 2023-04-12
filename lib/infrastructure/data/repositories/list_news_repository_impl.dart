

import 'package:flutter_news_app_getx/domain/repositories/list_news_repository.dart';

import '../../../domain/entities/category_model/news_app_model.dart';
import '../../../domain/entities/list_news/list_news_model.dart';
import '../data_sources/remote/remote_news_data_source.dart';

class ListNewsRepositoryImpl implements ListNewsRepository{
  final RemoteNewsDataSource _remoteNewsDataSource;

  ListNewsRepositoryImpl(this._remoteNewsDataSource);

  @override
  Future<NewsAppModel> getListNewsRes ({required String id}){
    return _remoteNewsDataSource.getListNewsRes(id: id);
  }
}