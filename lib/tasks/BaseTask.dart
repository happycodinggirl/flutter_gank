import 'package:flutter_app1/presenters/BasePresenter.dart';
import 'package:flutter_app1/views/BaseView.dart';
class BaseTask<P extends BasePresenter,V extends BaseView>{

  P presenter;
  V view;

 BaseTask(this.presenter,this.view);

}