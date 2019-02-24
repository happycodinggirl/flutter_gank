import 'package:dio/dio.dart';
import 'package:flutter_app1/utils/DioUtil.dart';
import 'package:flutter_app1/model/BaseModel.dart';
import 'package:flutter_app1/model/CatergoryItem.dart';
import 'package:flutter_app1/model/CatergoryChild.dart';
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
  }

  Future<BaseModel<List<CatergoryChild>>> getCatergoryChild(String type) async{
    String url="http://gank.io/api/xiandu/category/${type}";
    print("---url is "+url);
    Response response=await getDio().get(url);
    BaseModel<List<CatergoryChild>> baseModel;
    if (response.statusCode == HttpStatus.OK) {
      bool error=response.data['error'];
      print("error is $error");

      if(!error){
        List listJson=response.data['results'];
        print("----results is $listJson");
        List<CatergoryChild> catergoryChildList= listJson.map((json){
          return new CatergoryChild.fromJson(json);
        }).toList();
        baseModel=new BaseModel(error,catergoryChildList);
      }
    }


    return baseModel;

  }



}