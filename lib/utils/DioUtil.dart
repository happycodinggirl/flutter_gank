import 'package:dio/dio.dart';
class DioUtil{
  static DioUtil dioUtil;
  static Dio dio;

  static DioUtil getInstance(){
    if(dioUtil==null){
      dioUtil=new DioUtil();
    }

    return dioUtil;
  }


  void init(){


  }


  Dio getDio(){
    if(dio==null){
      dio=new Dio();
    }
    return dio;
  }


}