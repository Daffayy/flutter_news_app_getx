import 'package:flutter_news_app_getx/domain/repositories/list_news_repository.dart';

import '../entities/category_model/news_app_model.dart';


class ListNewsUseCase {
  final ListNewsRepository _listNewsRepository;
  ListNewsUseCase(this._listNewsRepository);

  Future<NewsAppModel> call({required String id}) {
    return _listNewsRepository.getListNewsRes(id: id);
  }
}
