

import '../entities/list_news/list_news_model.dart';


abstract class NewsRepository {
 Future <SourceAppModel> getNewsRes({required String category});

}