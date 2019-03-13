import 'package:flutter/widgets.dart';
import 'package:flutter_app1/model/CatergoryChild.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';

typedef onItemClickListener = void Function(int position);

class ItemView extends StatelessWidget {
  CatergoryChild item;
  int index;
  onItemClickListener listener;

  ItemView(this.item, this.index, this.listener);

  @override
  Widget build(BuildContext context) {
    return Padding(
      //为了添加点击水波纹效果而加上的
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
          onTap: () {
            listener(index);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    new FadeInImage.memoryNetwork(
                      image: item.icon,
                      placeholder: kTransparentImage,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: Text(
                        item.title,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      alignment: FractionalOffset.topLeft,
                    ),
                    Container(
                        margin: new EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                        child: Text(
                          item.created_at,
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ))
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class ListViewM extends StatelessWidget {
  List<CatergoryChild> catergoryChildList;
  ScrollController scrollController;
  bool isFetching;

  void setIsFetching(bool fetch){
    isFetching=fetch;
  }

  Widget buildCircleProgressBar() {
    return Padding(
      padding: EdgeInsets.all(8),
      child:Center(child: Opacity(
          opacity:1, child: CircularProgressIndicator()),
      ),) ;
  }

  ListViewM(this.catergoryChildList, this.scrollController, this.isFetching);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        if (index == catergoryChildList.length) {
          return buildCircleProgressBar();
        } else {
          CatergoryChild catergoryChild = catergoryChildList[index];
          return ItemView(catergoryChild, index, (index) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("第$index项被点击了")));
          });
        }
      },
      separatorBuilder: (context, index) {
        return new Divider(
          height: 1,
        );
      },
      itemCount: catergoryChildList.length + 1,
      controller: scrollController,
    );
  }
}
