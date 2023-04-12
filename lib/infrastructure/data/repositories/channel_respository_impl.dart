import 'package:flutter_news_app_getx/domain/repositories/channel_repository.dart';

import '../../../domain/entities/category_model/news_app_model.dart';
import '../../../domain/entities/list_news/list_news_model.dart';
import '../data_sources/remote/remote_news_data_source.dart';

class ChannelRepositoryImpl implements ChannelRepository {
  final RemoteNewsDataSource _remoteNewsDataSource;

  ChannelRepositoryImpl(this._remoteNewsDataSource);

  @override
  Future <SourceAppModel> getChannelRes ({required String channel}){
    return _remoteNewsDataSource.getChannelRes(channel: channel);
  }
}