import 'package:flutter/material.dart';
import 'package:flutter_app1/tasks/CatergoryTask.dart';
import 'package:flutter_app1/presenters/CatergoryPresenter.dart';
import 'package:flutter_app1/views/CatergoryView.dart';
import 'package:flutter_app1/model/CatergoryItem.dart';
import 'package:flutter_app1/ChildCatergoryPage.dart';
void main() =>runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)=> MaterialApp(home: CustomApp());

}

class CustomApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AppState();
  }

}
class AppState extends State<CustomApp> with SingleTickerProviderStateMixin implements CatergoryView {



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
  bool pageIsChanging=false;
  void onPageChange(int index, {PageController p}){
    if(p!=null) {
      pageIsChanging = true;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
      pageIsChanging=false;
    }else{
      tabController.animateTo(index);
    }

  }

  PageController pageController;
  @override
  Widget build(BuildContext context) {
    print("----build");
    if(categoryItemList==null){
      return new Scaffold(
        appBar: AppBar(title: Text("干活集中营"),),
        body:Center(child: CircularProgressIndicator(),),
      );
    }


    tabList=categoryItemList==null?null:generateTab(categoryItemList);
    tabController=new TabController(vsync:this,length:categoryItemList.length);

    tabController.addListener((){
      if(tabController.indexIsChanging){
        print(tabController.index);
        onPageChange(tabController.index,p:pageController);
      }
    });

    pageController=PageController(initialPage: 0);

    print("tabList is $tabList");
    return MaterialApp(home: Scaffold(
        appBar: AppBar(
          title: Text("干货集中营"),
          backgroundColor: Colors.blue,
          bottom: new TabBar(
            controller: tabController,

            isScrollable: true,
            tabs: tabList,
            indicatorColor: Colors.red,
            labelColor: Colors.white,
          )
          ,),
        drawer: Drawer(child: getDrawer(),),

        body:PageView.builder(itemBuilder: (BuildContext context,int index){
          return new ChildCatergoryPage(categoryItemList[index].en_name);

        },itemCount: categoryItemList.length,
        controller: pageController,

          onPageChanged: (index){
              if(!pageIsChanging){
                onPageChange(index);
              }
          },
        )
    ),
    );
  }

  Widget getDrawer(){
   return  ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
   new UserAccountsDrawerHeader(
   accountName: new Text('lily'),
    accountEmail: new Text('1369246510@qq.com'),
    currentAccountPicture: new CircleAvatar(
    backgroundImage: new NetworkImage(
    'https://profile.csdnimg.cn/7/0/A/1_u010095768'),
    ),
    ),
    ListTile(
    title: Text('个人中心'),
    onTap: () {
    // Update the state of the app
    // ...
    // Then close the drawer
    Navigator.pop(context);
    },
    ),
    Divider(height: 1,),
    ListTile(
    title: Text('设置'),
    onTap: () {
    // Update the state of the app
    // ...
    // Then close the drawer
    Navigator.pop(context);
    },
    ),
   Divider(height: 1,),
    ]);
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

  @override
  void dispose() {
    tabController.dispose();
    pageController.dispose();
    super.dispose();
  }
}
