

import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app_getx/domain/entities/category_model/news_app_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../domain/core/utils/snackbar_util.dart';
import '../../../domain/use_case/search/search_use_case.dart';

class SearchController extends GetxController{
  ScrollController scrollController = ScrollController();
  final SearchUseCase _searchUseCase;
  RxBool isLoading = false.obs;
  RxList<Article> searcNewsItem = <Article>[].obs;

  SearchController(this._searchUseCase);

  @override
  void onInit() {
    super.onInit();
  }
  Future<void> getSearchNews({required String searchFood}) async {
    isLoading.toggle();
    searcNewsItem.clear();
    searchFood.toLowerCase();
    try {
      final responseSearch =
      await _searchUseCase.call(searchParams: searchFood);
      searcNewsItem.addAll(responseSearch.articles!);
      isLoading.toggle();
      Logger().d(responseSearch);
    } catch (e) {
      isLoading.toggle();
      SnackbarUtil.showError(message: e.toString());
      Logger().e(e.toString());
    }
  }
}