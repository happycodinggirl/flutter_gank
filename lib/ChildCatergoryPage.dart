import 'package:flutter/widgets.dart';
import 'package:flutter_app1/tasks/CatergoryChildTask.dart';
import 'package:flutter_app1/presenters/CatergoryPresenter.dart';
import 'package:flutter_app1/views/CatergoryChildView.dart';
import 'package:flutter_app1/widgets/ListViewM.dart';
import 'package:flutter_app1/model/CatergoryChild.dart';
import 'package:flutter/material.dart';

class ChildCatergoryPage extends StatefulWidget {
  String type;

  ChildCatergoryPage(this.type);

  @override
  State<StatefulWidget> createState() {
    return new ChildState(type);
  }
}

class ChildState extends State<ChildCatergoryPage>
    implements CatergoryChildView {
  String type;

  int lastPressTime;

  bool isFetching = false;

  var fetchCount = 0;

  bool loadMore=false;

  ChildState(this.type);

  ScrollController scrollController = ScrollController();

  CatergoryChildTask catergoryChildTask;

  List<CatergoryChild> catergoryChildList;

  @override
  void initState() {
    super.initState();
    catergoryChildTask = new CatergoryChildTask(new CatergoryPresenter(), this);
    loadMore=false;
    getData();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMore=true;
        getData();

      }
    });
  }

  Widget buildSingleTile(BuildContext context, CatergoryChild catergoryChild) {
    return new ListTile(
      leading: new Image.network(
        catergoryChild.icon, height: 100.0, //设置图片的高
        width: 100.0, //设置图片的宽
        fit: BoxFit.cover,
      ),
      title: Text(catergoryChild.title),
      subtitle: new Text(catergoryChild.created_at), //子item的内容
      trailing: new Icon(
        Icons.arrow_right,
        color: Colors.green,
      ), //显示右侧的箭头，不显示则传null
    );
  }

  ListViewM listViewM;

  getData(){
    print("------getData ----isFetching is $isFetching");

    if (!isFetching) {
      catergoryChildTask.getCatergoryTask(type);
      isFetching = true;
    }


  }

  @override
  Widget build(BuildContext context) {
    if (catergoryChildList == null) {
      return new Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    print("-----childPage build");
    listViewM = ListViewM(catergoryChildList, scrollController, isFetching);
    return RefreshIndicator(
      child: listViewM,
      onRefresh: () async{
        print("---onRefresh");
        loadMore=false;
        getData();
        return null;
      },
      color: Colors.blue,
    );
  }

  @override
  void onLoadDataFail() {
    debugPrint("----onLoadDataFail ");
    setState(() {
      isFetching = false;
    });
  }

  @override
  void onLoadDataSuccess(t) {

      isFetching = false;
      if(loadMore) {
        fetchCount++;
      }
      if (fetchCount > 3) {
        listViewM.setOfStage(true);
      //  scrollanimToEnd();
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("没有更多喽")));
        setState(() {

        });
      } else {
        if (catergoryChildList == null) {
          catergoryChildList = t.results;
        } else {
          catergoryChildList.addAll(t.results);
        }
        setState(() {

        });
      }

  }

  void scrollanimToEnd() {
     double edge = 50;
    double offsetPix = scrollController.position.maxScrollExtent -
        scrollController.position.pixels;
    if (offsetPix < edge) {
      scrollController.animateTo(
          scrollController.offset - (edge - offsetPix),
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut);
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
