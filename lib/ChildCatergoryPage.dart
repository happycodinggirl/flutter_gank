import 'package:flutter/widgets.dart';
import 'package:flutter_app1/tasks/CatergoryChildTask.dart';
import 'package:flutter_app1/presenters/CatergoryPresenter.dart';
import 'package:flutter_app1/views/CatergoryChildView.dart';
import 'package:flutter_app1/model/CatergoryChild.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
      
   /* Iterable<Widget> listTiles=catergoryChildList.map((item){
      return buildSingleTile(context, item);
    }).toList();

    listTiles=ListTile.divideTiles(tiles: listTiles,context: context);*/

  /*  return  new Scaffold(
      body:ListView.separated(
          itemBuilder: (BuildContext context,int index){
        CatergoryChild catergoryChild=catergoryChildList[index];
        return new ListTile(leading:getImage(catergoryChild.icon),
          title:Text(catergoryChild.title),
          subtitle: new Text(catergoryChild.created_at),//子item的内容
          trailing: new Icon(Icons.arrow_right,color: Colors.green,),//显示右侧的箭头，不显示则传null
        );
      },
        separatorBuilder:(context,index){
            return new Divider(height: 1,);
        },
      itemCount: catergoryChildList.length,

      ),
      );*/

    return  new Container(
      child:ListView.separated(
        itemBuilder: (BuildContext context,int index){
          CatergoryChild catergoryChild=catergoryChildList[index];
          return getItem(catergoryChild,index);
        },
        separatorBuilder:(context,index){
          return new Divider(height: 1,);
        },
        itemCount: catergoryChildList.length,



      ),
    );




  }

  Widget getItem(CatergoryChild item,int index){
    return GestureDetector(
      onTap: (){
        final snackBar = new SnackBar(content: new Text('第$index项被点击了!'));

        Scaffold.of(context).showSnackBar(snackBar);
      },
        child:Padding(
      padding: EdgeInsets.only(left:10,top:0,right:10,bottom:0),
      child: Row(children: <Widget>[
        Column(children: <Widget>[new FadeInImage.memoryNetwork(image:item.icon,placeholder:kTransparentImage
          ,fit: BoxFit.cover,width: 100,height: 100,)],crossAxisAlignment: CrossAxisAlignment.start,),
        Column(children: <Widget>[Container(margin: new EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),child:Text(item.title,style: TextStyle(color: Colors.black,fontSize: 20),) ,alignment:FractionalOffset.topLeft,)
        ,Container(margin: new EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),child:Text(item.created_at,style: TextStyle(color: Colors.grey,fontSize: 15),) )],)
      ],),

    ));
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