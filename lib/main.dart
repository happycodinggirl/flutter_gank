import 'package:flutter/material.dart';
import 'package:flutter_app1/tasks/CatergoryTask.dart';
import 'package:flutter_app1/presenters/CatergoryPresenter.dart';
import 'package:flutter_app1/views/CatergoryView.dart';
import 'package:flutter_app1/model/CatergoryItem.dart';
void main() =>runApp(MyApp());
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new AppState();
  }
}
class AppState extends State<MyApp> with SingleTickerProviderStateMixin implements CatergoryView {
/*  List<Tab> tabList=
  [   Tab(text:"android"),
  Tab(text: "ios",),
  Tab(text:"flutter"),
  Tab(text: "kotlin",),
  Tab(text: "dart",),
  Tab(text: "java",)];*/

  List<CategoryItem> categoryItemList;

  List<Tab> generateTab(List<CategoryItem> cateItemList){

      List<Tab> tabList=cateItemList.map((cateItem){
       return new Tab(text: cateItem.name,);
      }).toList();
      print("tabList sizer is ${tabList.length}");
     return tabList;
  }
  TabController tabController;
  CatergoryTask catergoryTask;
  List<Tab> tabList;
  @override
  void initState() {
    super.initState();

    catergoryTask=new CatergoryTask(new CatergoryPresenter(),this);
    catergoryTask.getCatergory();

  }
  @override
  Widget build(BuildContext context) {
    print("----build");
    if(categoryItemList==null){
      return Container(child: CircularProgressIndicator(backgroundColor: Colors.red,),);
    }

    tabList=categoryItemList==null?null:generateTab(categoryItemList);
    tabController=new TabController(vsync:this,length:categoryItemList.length);

    print("tabList is $tabList");
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Text("tabbar"),
        backgroundColor: Colors.blue,
        bottom: new TabBar(
          controller: tabController,

          isScrollable: true,
          tabs: tabList,
          indicatorColor: Colors.red,
          labelColor: Colors.white,
        )
        ,),
      body: TabBarView(
        controller: tabController,
          children:tabList.map((tab)=>Center(child: Text(tab.text),)).toList()
      ),
    ),
    );
  }

  @override
  void onLoadDataFail() {
    print("----loadDataFail ");

  }

  @override
  void onLoadDataSuccess(t) {
    print("----loadDataSuccess is $t");
    setState(() {
      categoryItemList=t.results;
    });

  }
}