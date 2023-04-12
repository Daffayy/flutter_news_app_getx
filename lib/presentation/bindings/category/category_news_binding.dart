

import 'package:flutter_news_app_getx/domain/repositories/news_repository.dart';
import 'package:flutter_news_app_getx/infrastructure/data/data_sources/remote/remote_news_data_source.dart';
import 'package:flutter_news_app_getx/infrastructure/data/repositories/news_repository_impl.dart';
import 'package:flutter_news_app_getx/presentation/controllers/category/category_news_controller.dart';
import 'package:get/get.dart';

import '../../../domain/use_case/news_use_case.dart';

class CategoryNewsBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<CategoryNewsController>(() => CategoryNewsController(
    ));
  }
}