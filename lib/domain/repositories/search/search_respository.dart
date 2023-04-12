import '../../entities/category_model/news_app_model.dart';

abstract class SearchRepository{
  Future<NewsAppModel> doGetSearchNews({required String searchParams});
}