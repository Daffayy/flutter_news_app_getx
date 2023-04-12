import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../domain/core/constants/color_constants.dart';
import '../../../domain/core/constants/content_constants.dart';
import '../../../domain/core/constants/snackbar_constants.dart';
import '../../controllers/search/search_controller.dart';

class NoItemView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: onSurfaceTextColor,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 30,
                      width: 300,
                      child: TextFormField(
                        style:
                        const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 175,
              ),
              Column(
                children: [
                  Image.asset('assets/img/search.png', color: search),
                  const SizedBox(
                    height: 20,
                  ),
                   Text(
                    SnackBarConstants.snackbarEmpty,
                    style:
                    TextStyle(color: fontContent, fontSize: 28, fontWeight: FontWeight
                        .bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Text(ContentConstants.trysearch,
                      style: TextStyle(fontSize: 18, color: contentTrySearch)),
                   Text(ContentConstants.trysearch2,
                      style: TextStyle(fontSize: 18, color: contentTrySearch)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}