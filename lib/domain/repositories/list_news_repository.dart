
import 'package:flutter_news_app_getx/domain/entities/category_model/news_app_model.dart';

abstract class ListNewsRepository{
  Future<NewsAppModel> getListNewsRes({required String id});
}