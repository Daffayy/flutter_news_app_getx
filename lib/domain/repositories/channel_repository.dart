
import '../entities/list_news/list_news_model.dart';

abstract class ChannelRepository {
  Future<SourceAppModel> getChannelRes({required String channel});
}