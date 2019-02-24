import 'package:flutter_app1/tasks/BaseTask.dart';
import 'package:flutter_app1/presenters/CatergoryPresenter.dart';
import 'package:flutter_app1/views/CatergoryView.dart';

class CatergoryTask extends BaseTask<CatergoryPresenter,CatergoryView>{





  void getCatergory() async{
    presenter.getCatergory().then((onValue){
      print("onValue is $onValue");
      if(onValue!=null){
        view.onLoadDataSuccess(onValue);
      }else{
        view.onLoadDataFail();
      }
    });


  }

  CatergoryTask(presenter,view):super(presenter,view);

}