import 'package:dio/dio.dart';
import 'package:flutter_app1/utils/DioUtil.dart';
import 'package:flutter_app1/model/BaseModel.dart';
import 'package:flutter_app1/model/CatergoryItem.dart';
import 'dart:io';


class BasePresenter {

  Dio dio = DioUtil.getInstance().getDio();

  Dio getDio(){
    if(dio==null){
      dio=DioUtil.getInstance().getDio();
    }
    return dio;
  }

}