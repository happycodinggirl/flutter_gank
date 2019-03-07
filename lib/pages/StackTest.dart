import 'package:flutter/material.dart';

class StackTest extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    var stack=Stack(alignment: Alignment(-0.5, -0.5),
      children: <Widget>[
        Container(width: 200,height: 200,color: Colors.blue,),
        Text("i am here",style: TextStyle(color: Colors.black,fontSize: 12,decoration: TextDecoration.none),)
      ],
    );
    return stack;
  }

}

