import 'package:dio/dio.dart';
class DioUtil{
  DioUtil dioUtil;
  static Dio dio;
  DioUtil getInstance(){
    if(dioUtil==null){
      dioUtil=new DioUtil().init();
    }
    return dioUtil;
  }

  DioUtil init(){
    dio=new Dio();
    return this;
  }

  Dio getDio(){
    return dio;
  }


}