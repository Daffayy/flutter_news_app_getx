


import '../../../domain/entities/list_news/list_news_model.dart';
import '../../../domain/repositories/news_repository.dart';
import '../data_sources/remote/remote_news_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final RemoteNewsDataSource _remoteNewsDataSource;

  NewsRepositoryImpl(this._remoteNewsDataSource);

  @override
  Future <SourceAppModel> getNewsRes ({required String category}){
    return _remoteNewsDataSource.getNewsRes(category: '');
  }

}