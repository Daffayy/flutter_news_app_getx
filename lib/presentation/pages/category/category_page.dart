
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app_getx/domain/entities/news_app_model/utils.dart';
import 'package:flutter_news_app_getx/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../controllers/category/category_news_controller.dart';

class CategoryPage extends GetView<CategoryNewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        margin: EdgeInsets.only(top: 80,bottom: 300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: listOfCategory.length,
              itemBuilder: (context, index) {
                return Center(
                    child: GestureDetector(
                  onTap: () {
                    controller.category.value =
                        listOfCategory[index]['code']!;
                    Logger().d(controller.category.value);
                    Get.toNamed(Routes.CHANNEL,
                        arguments: controller.category.value);
                  },
                  child:
                      Container(child: Text(listOfCategory[index]['name']!)),
                ));
              }),
        ),
      ),
    );
  }
}
