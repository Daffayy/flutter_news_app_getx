

import 'package:flutter_news_app_getx/domain/repositories/channel_repository.dart';
import '../entities/list_news/list_news_model.dart';

class ChannelUseCase{
  final ChannelRepository _channelRepository;
  ChannelUseCase(this._channelRepository);

  Future<SourceAppModel>call({required String channel}){
    return _channelRepository.getChannelRes(channel: channel);
  }
}