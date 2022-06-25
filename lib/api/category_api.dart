import 'package:dio/dio.dart';
import 'package:secondhand/api/http_services.dart';
import 'package:secondhand/model/dropdown_category.dart';
import 'package:secondhand/response/category_response.dart';
import 'package:secondhand/utils/api_url.dart';
import 'package:flutter/cupertino.dart';

class CategoryAPI {
  Future<List<DropdownCategory?>> loadCategory() async {
    List<DropdownCategory?> dropdownCategoryList = [];
    Response response;
    var url = baseUrl + categoryUrl;
    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.get(url);

      if (response.statusCode == 201) {
        CategoryResponse categoryResponse =
            CategoryResponse.fromJson(response.data);

        for (var data in categoryResponse.data!) {
          dropdownCategoryList.add(
            DropdownCategory(
              id: data.id,
              name: data.name,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get category $e');
    }

    return dropdownCategoryList;
  }
}
