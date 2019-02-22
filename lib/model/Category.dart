import 'package:flutter_app1/model/BaseModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app1/utils/DioUtil.dart';

class Category extends BaseModel<List<CategoryItem>>{
  Category(bool error, List<CategoryItem> results) : super(error, results);
}
class CategoryItem{
  String _id;
  String en_name;
  String name;
  int rank;

  CategoryItem.fromJson(Map<String,dynamic> json):
      _id=json['_id'],
      en_name=json['en_name'],
      name=json['name'],
      rank=json['rank'];
}

class CatergoryApi{
  String url="http://gank.io/api/xiandu/categories";
  Dio dio=new DioUtil().getInstance().getDio();

  Future<Category> getCategory() async{

  }




}