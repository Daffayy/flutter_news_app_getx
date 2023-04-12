class Routes {
  static Future<String> get initialRoute async {
    return CATEGORY;
  }

  static const CATEGORY = '/category';
  static const CHANNEL = '/channel';
  static const LISTNEWS = '/listNews';
  static const SEARCH = '/search';
}
