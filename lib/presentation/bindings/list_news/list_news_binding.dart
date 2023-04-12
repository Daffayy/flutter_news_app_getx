
import 'package:flutter_news_app_getx/domain/repositories/list_news_repository.dart';
import 'package:flutter_news_app_getx/domain/use_case/list_news_use_case.dart';
import 'package:flutter_news_app_getx/infrastructure/data/repositories/list_news_repository_impl.dart';
import 'package:flutter_news_app_getx/presentation/controllers/list_news/list_news_controller.dart';
import 'package:get/get.dart';

import '../../../infrastructure/data/data_sources/remote/remote_news_data_source.dart';

class ListNewsBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut<RemoteNewsDataSource>(() => RemoteNewsDataSource());
    Get.lazyPut<ListNewsRepository>(() => ListNewsRepositoryImpl(Get.find<RemoteNewsDataSource>()));
    Get.lazyPut<ListNewsUseCase>(() => ListNewsUseCase(Get
        .find<ListNewsRepository>()));
    Get.lazyPut<ListNewsController>(() => ListNewsController(
        Get.find<ListNewsUseCase>()
    ));
  }
}