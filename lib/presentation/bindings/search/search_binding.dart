
import 'package:flutter_news_app_getx/infrastructure/data/data_sources/remote/remote_news_data_source.dart';
import 'package:get/get.dart';

import '../../../domain/repositories/search/search_respository.dart';
import '../../../domain/use_case/search/search_use_case.dart';
import '../../../infrastructure/data/repositories/search/search_repository_impl.dart';
import '../../controllers/search/search_controller.dart';

class SearchBinding extends Bindings{

  @override
  void dependencies(){
  Get.lazyPut<RemoteNewsDataSource>(() => RemoteNewsDataSource());
  Get.lazyPut<SearchRepository>(
          () => SearchRepositoryImpl(Get.find<RemoteNewsDataSource>()));
  Get.lazyPut<SearchUseCase>(
          () => SearchUseCase(Get.find<SearchRepository>()));
  Get.lazyPut<SearchController>(
          () => SearchController(
          Get.find<SearchUseCase>()
      ));
  }
}