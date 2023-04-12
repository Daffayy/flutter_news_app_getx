import 'package:flutter/material.dart';
import 'package:flutter_news_app_getx/presentation/pages/category/category_page.dart';
import 'package:flutter_news_app_getx/presentation/pages/channel/channel_page.dart';
import 'package:flutter_news_app_getx/presentation/pages/list_news/list_news_page.dart';



import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/bindings/category/category_news_binding.dart';
import '../../presentation/bindings/channel/channel_binding.dart';
import '../../presentation/bindings/list_news/list_news_binding.dart';
import '../../presentation/bindings/search/search_binding.dart';
import '../../presentation/pages/search/search_page.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.CATEGORY,
      page: () =>  CategoryPage(),
      binding: CategoryNewsBinding(),
    ),
    GetPage(
      name: Routes.CHANNEL,
      page: () =>  ChannelPage(),
      binding: ChannelBinding(),
    ),
    GetPage(
      name: Routes.LISTNEWS,
      page: () =>  ListNewsPage(),
      binding: ListNewsBinding(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () =>  SearchPage(),
      binding: SearchBinding(),
    ),
  ];
}
