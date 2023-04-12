
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/core/constants/color_constants.dart';
import '../../controllers/search/search_controller.dart';
import '../../widgets/search/no_item_view.dart';
import '../news/news_page.dart';

class SearchPage extends GetView<SearchController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: onSurfaceTextColor,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: fontContent,
            ),
          ),
        ),
        backgroundColor: onSurfaceTextColor,
        title: Container(
          padding: const EdgeInsets.all(8),
          child: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            onSubmitted: (value) =>
                controller.getSearchNews(searchFood: value),
          ),
        ),
      ),
      body: Obx(() =>
      controller.isLoading.value
          ? CircularProgressIndicator()
          : (controller.searcNewsItem.isNotEmpty
          ? SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 30,
              margin: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Text(
                  "Found ${controller.searcNewsItem.length} Result",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: onSurfaceTextColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: controller.searcNewsItem.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(NewsPage(
                          newsUrl: controller.searcNewsItem[index].url));
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
                            controller.searcNewsItem[index].urlToImage ==
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
                                    .searcNewsItem[index]
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
                                      "${controller.searcNewsItem[index].source!.name!}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2),
                                ),
                              ),
                            ),
                          ]),
                          Divider(),
                          Text("${controller.searcNewsItem[index].title}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ) : NoItemView()
      )),
    );
  }
}