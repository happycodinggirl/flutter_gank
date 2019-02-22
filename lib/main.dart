import 'package:flutter/material.dart';
void main() =>runApp(MyApp());
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new AppState();
  }
}
class AppState extends State<MyApp> with SingleTickerProviderStateMixin {
  List<Tab> tabList=
  [   Tab(text:"android"),
  Tab(text: "ios",),
  Tab(text:"flutter"),
  Tab(text: "kotlin",),
  Tab(text: "dart",),
  Tab(text: "java",)];
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController=new TabController(vsync:this,length:6);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Text("tabbar"),
        backgroundColor: Colors.blue,
        bottom: new TabBar(
          controller: tabController,
          tabs: tabList,
          isScrollable: true,
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
}