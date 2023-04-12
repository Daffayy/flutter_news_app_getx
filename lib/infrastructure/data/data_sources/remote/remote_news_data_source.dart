import 'package:flutter_news_app_getx/domain/core/constants/storage_constants.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../domain/core/utils/snackbar_util.dart';
import '../../../../domain/entities/category_model/news_app_model.dart';
import '../../../../domain/entities/list_news/list_news_model.dart';
import '../../../../domain/entities/news_app_model/ArticalModel.dart';
import '../../../../domain/entities/news_app_model/NewsModel.dart';


class RemoteNewsDataSource {
  final connect = Get.find<GetConnect>();


 Future<SourceAppModel>getNewsRes({required String category}) async {
    final url = "top-headlines?country=in&category=$category&${StorageConstants
        .token}";
    print(url);
    final response = await connect.get(url,
        decoder:
      (data) =>
          SourceAppModel
            .fromJson(data));
    Logger().i(response.statusCode);
    if (!response.hasError) {
      return response.body!;
    } else {
      throw SnackbarUtil.showError(message: response.statusCode.toString());
    }
  }

  Future<SourceAppModel>getChannelRes({required String channel}) async{
    final response = await connect.get(
        "top-headlines/sources?category=$channel&apiKey=2c06313242f34a50812b97111fea7f2f",
        decoder:
        (data) =>
            SourceAppModel
            .fromJson(data));
    Logger().i(response.statusCode);
    if (!response.hasError) {
      return response.body!;
    } else {
      throw SnackbarUtil.showError(message: response.statusCode.toString());
    }
  }
  Future<NewsAppModel>getListNewsRes({required String id}) async{
    final response = await connect.get(
        "everything?sources=$id&apiKey=2c06313242f34a50812b97111fea7f2f", decoder:
        (data) =>
            NewsAppModel
            .fromJson(data));
    Logger().i(response.statusCode);
    if (!response.hasError) {
      return response.body!;
    } else {
      throw SnackbarUtil.showError(message: response.statusCode.toString());
    }
  }
  Future<NewsAppModel> doGetSearchNews({required String searchParams}) async{
    final response = await connect.get(
      "everything?q=$searchParams&apiKey=2c06313242f34a50812b97111fea7f2f"
    ,decoder: (data) => NewsAppModel.fromJson(data));
    Logger().d(response.statusCode);
    if (!response.hasError) {
      return response.body!;
    } else {
      throw SnackbarUtil.showError(message: response.statusCode.toString());
    }
  }
}
