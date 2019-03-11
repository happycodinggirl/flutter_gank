import 'package:flutter/widgets.dart';
import 'package:flutter_app1/tasks/CatergoryChildTask.dart';
import 'package:flutter_app1/presenters/CatergoryPresenter.dart';
import 'package:flutter_app1/views/CatergoryChildView.dart';
import 'package:flutter_app1/widgets/ListViewM.dart';
import 'package:flutter_app1/model/CatergoryChild.dart';
import 'package:flutter/material.dart';


class ChildCatergoryPage extends StatefulWidget{

  String type;


  ChildCatergoryPage(this.type);

  @override
  State<StatefulWidget> createState() {
    return new ChildState(type);
  }

}

class ChildState extends State<ChildCatergoryPage>  implements CatergoryChildView{

  String type;

  int lastPressTime;


  ChildState(this.type);

  CatergoryChildTask catergoryChildTask;

  List<CatergoryChild> catergoryChildList;
  @override
  void initState() {
    super.initState();
    catergoryChildTask=new CatergoryChildTask(new CatergoryPresenter(), this);
    catergoryChildTask.getCatergoryTask(type);
  }

  Widget buildSingleTile(BuildContext context,CatergoryChild catergoryChild){
    return new ListTile(leading:new Image.network(catergoryChild.icon, height: 100.0,//设置图片的高
      width: 100.0,//设置图片的宽
      fit: BoxFit.cover,),
      title:Text(catergoryChild.title),
      subtitle: new Text(catergoryChild.created_at),//子item的内容
      trailing: new Icon(Icons.arrow_right,color: Colors.green,),//显示右侧的箭头，不显示则传null
    );
  }




  @override
  Widget build(BuildContext context) {

    if(catergoryChildList==null){
      return new Scaffold(
        body:Center(child: CircularProgressIndicator(),),
      );
    }
    return  new ListViewM(catergoryChildList);
  }

  @override
  void onLoadDataFail() {

  }

  @override
  void onLoadDataSuccess(t) {
    setState(() {
      catergoryChildList=t.results;
    });

  }

  @override
  void dispose() {
    super.dispose();
  }

}