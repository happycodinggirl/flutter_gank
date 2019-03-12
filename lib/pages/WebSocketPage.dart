import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketPage extends StatefulWidget {
  WebSocketChannel webSocketChannel;


  WebSocketPage(@required this.webSocketChannel);

  @override
  State<StatefulWidget> createState() {
    return WebSocketState();
  }
}

class WebSocketState extends State<WebSocketPage> {
  TextEditingController controller = TextEditingController();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.webSocketChannel.stream.listen((message){
      debugPrint("----listen message is ${message}");

    },onError: (error,StackTrace stackTrace){
      debugPrint("----ws onError is $error ,stackTrace is $stackTrace");

    },onDone: (){
      debugPrint("----ws onDone");
    });
  }

  @override
  Widget build(BuildContext context) {
    var container = Scaffold(
      appBar: AppBar(
        title: Text("i am title"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Form(
                child: TextFormField(
              controller: controller,
              decoration: InputDecoration(labelText: "send a message"),
            )),
            StreamBuilder(
                stream: widget.webSocketChannel.stream,
                builder: (context, snapshot) {
                  debugPrint("=====streamBuilder content is ${snapshot.data}");
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text(snapshot.hasData ?snapshot.data:""),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: sendMessage,child: Icon(Icons.send),),
    );
    /*Padding(padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Form(child: TextFormField(controller:controller
                ,
          decoration: InputDecoration(labelText: "send a message"),
  ))
  ,
  StreamBuilder(
  stream: widget.webSocketChannel.stream,
  builder: (context,snapshot){

    return Padding(padding:EdgeInsets.symmetric(vertical: 24)
        ,child: Text(snapshot.hasData??snapshot.data),);
  })
  ,


        ],
      ),
    );
    return container;*/
    return container;
  }

  void sendMessage(){

    if(controller.text.isNotEmpty){
      debugPrint("-----hahh send msg");
      widget.webSocketChannel.sink.add(controller.text);
    }
  }

  @override
  void dispose() {
    widget.webSocketChannel.sink.close();
    super.dispose();

  }
}
