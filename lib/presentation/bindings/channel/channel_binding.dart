

import 'package:flutter_news_app_getx/presentation/controllers/channel/channel_controller.dart';
import 'package:get/get.dart';

import '../../../domain/repositories/channel_repository.dart';
import '../../../domain/use_case/channel_use_case.dart';
import '../../../infrastructure/data/data_sources/remote/remote_news_data_source.dart';
import '../../../infrastructure/data/repositories/channel_respository_impl.dart';

class ChannelBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<RemoteNewsDataSource>(() => RemoteNewsDataSource());
    Get.lazyPut<ChannelRepository>(() => ChannelRepositoryImpl(Get.find<RemoteNewsDataSource>
      ()));
    Get.lazyPut<ChannelUseCase>(() => ChannelUseCase(Get.find<ChannelRepository>()));
    Get.lazyPut<ChannelController>(() => ChannelController(
      Get.find<ChannelUseCase>()
    ));
  }
}