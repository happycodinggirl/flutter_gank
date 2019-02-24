import 'package:flutter_app1/tasks/BaseTask.dart';
import 'package:flutter_app1/presenters/CatergoryPresenter.dart';
import 'package:flutter_app1/views/CatergoryChildView.dart';

class CatergoryChildTask extends BaseTask<CatergoryPresenter,CatergoryChildView>{
  CatergoryChildTask(CatergoryPresenter presenter, CatergoryChildView view) : super(presenter, view);

  void getCatergoryTask(String type) async{
    presenter.getCatergoryChild(type).then((model){
      if(model!=null){
        view.onLoadDataSuccess(model);
      }else{
        view.onLoadDataFail();
      }
    });
  }

}