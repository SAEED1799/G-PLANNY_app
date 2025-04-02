import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/search_controller.dart';

class SearchInputText extends StatelessWidget {
  const SearchInputText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GetBuilder<SearchController>(
            init: SearchController(),
            builder: (controller) => TextFormField(
              onChanged: (search) => controller.updateText(search),
              controller: controller.searchTextController,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                icon: Icon(Icons.search),
                hintText: 'Search',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
