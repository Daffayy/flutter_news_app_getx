

import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app_getx/domain/use_case/channel_use_case.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../domain/core/utils/snackbar_util.dart';
import '../../../domain/entities/list_news/list_news_model.dart';

class ChannelController extends GetxController{
  final arguments = Get.arguments;
  final ChannelUseCase _channelUseCase;
  List<Sources> listNews = <Sources>[].obs;
  ScrollController scrollController = ScrollController();
  RxBool isLoading = false.obs;
  RxString id = ''.obs;

  ChannelController(this._channelUseCase);

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(_scrollListener);
    getChannel(channel: arguments);
    Logger().d(arguments);
    super.onInit();
  }
  _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoading.value = true;
    }
  }

  Future<void> getChannel({required String channel}) async {
    isLoading.toggle();
      try {
        final response = await _channelUseCase.call(channel: channel);
        // listNews.clear();
        listNews.addAll(response.sources!);
        isLoading.value = false;
        update();
        Logger().d(response);
      } catch (e) {
        SnackbarUtil.showError(message: e.toString());
        Logger().e(e.toString());
      }
    }
}