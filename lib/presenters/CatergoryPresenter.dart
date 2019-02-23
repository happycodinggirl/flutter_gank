import 'package:dio/dio.dart';
import 'package:flutter_app1/utils/DioUtil.dart';
import 'package:flutter_app1/model/BaseModel.dart';
import 'package:flutter_app1/model/CatergoryItem.dart';
import 'package:flutter_app1/presenters/BasePresenter.dart';
import 'dart:io';
import 'dart:convert';

class CatergoryPresenter extends BasePresenter{

  Future<BaseModel<List<CategoryItem>>> getCatergory() async {
    String url = "http://gank.io/api/xiandu/categories";

    Response response = await getDio().get(url);

    BaseModel<List<CategoryItem>> model = new BaseModel(
        true, null);

    if (response.statusCode == HttpStatus.OK) {
        bool error=response.data['error'];

      print("---model is $model");
      List<CategoryItem> categoryItemList = null;
      if (!error) {
        List catergaryList = response.data['results'];
        print("  catergaryList is $catergaryList");
        categoryItemList =
            catergaryList.map((model) => new CategoryItem.fromJson(model)).toList();
        print("----categoryItem list is $categoryItemList");
        model = new BaseModel( false,  categoryItemList);
      }
    }

    print("---model is $model");
    return model;

   // return model;
  }
}