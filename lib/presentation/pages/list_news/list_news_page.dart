import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app_getx/domain/core/constants/content_constants.dart';
import 'package:flutter_news_app_getx/domain/core/constants/snackbar_constants.dart';
import 'package:flutter_news_app_getx/infrastructure/navigation/routes.dart';
import 'package:flutter_news_app_getx/presentation/controllers/list_news/list_news_controller.dart';
import 'package:flutter_news_app_getx/presentation/pages/news/news_page.dart';
import 'package:get/get.dart';

import '../../../domain/core/constants/color_constants.dart';

class ListNewsPage extends GetView<ListNewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F8),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(ContentConstants.news, style: TextStyle(color: Colors.black)),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.SEARCH);
            },
            child: Icon(
              Icons.search_sharp,
              color: fontContent,
            ),
          ),
        ],
      ),
      body: GetBuilder<ListNewsController>(
        builder: (controller) {
          return controller.notFound.value
              ? Center(child: Text(SnackBarConstants.snackbarEmpty, style: TextStyle(fontSize: 30)))
              : controller.news.length == 0
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      controller: controller.scrollController,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(NewsPage(
                                        newsUrl: controller.news[index].url));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Column(
                                      children: [
                                        Stack(children: [
                                          controller.news[index].urlToImage ==
                                                  null
                                              ? Container()
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: CachedNetworkImage(
                                                    placeholder: (context,
                                                            url) =>
                                                        Container(
                                                            child:
                                                                CircularProgressIndicator()),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                    imageUrl: controller
                                                            .news[index]
                                                            .urlToImage ??
                                                        '',
                                                  ),
                                                ),
                                          Positioned(
                                            bottom: 8,
                                            right: 8,
                                            child: Card(
                                              elevation: 0,
                                              color: Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.8),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 8),
                                                child: Text(
                                                    "${controller.news[index].source!.name!}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle2),
                                              ),
                                            ),
                                          ),
                                        ]),
                                        Divider(),
                                        Text("${controller.news[index].title}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            index == controller.news.length - 1 &&
                                    controller.isLoading == true
                                ? Center(child: CircularProgressIndicator())
                                : SizedBox(),
                          ],
                        );
                      },
                      itemCount: controller.news.length,
                    );
        },
      ),
    );
  }
}
