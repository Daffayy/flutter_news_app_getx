
import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app_getx/domain/use_case/list_news_use_case.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../domain/core/utils/snackbar_util.dart';
import '../../../domain/entities/category_model/news_app_model.dart';

class ListNewsController extends GetxController{
  final arguments = Get.arguments;
  final ListNewsUseCase _listNewsUseCase;
  List<Article> news = <Article>[].obs;
  RxBool isLoading = false.obs;
  RxBool notFound = false.obs;
  ScrollController scrollController = ScrollController();

  ListNewsController(this._listNewsUseCase);

  @override
  void onInit() {
    getListNews(id: arguments);
    Logger().d(arguments);
    super.onInit();
  }

  Future<void> getListNews({required String id}) async {
    isLoading.toggle();
    try {
      final response = await _listNewsUseCase.call(id: id);
      news.addAll(response.articles!);
      isLoading.value = false;
      update();
      Logger().d(response);
    } catch (e) {
      SnackbarUtil.showError(message: e.toString());
      Logger().e(e.toString());
    }
  }

}