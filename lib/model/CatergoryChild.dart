class CatergoryChild{
  String _id;
  String created_at;
  String icon;
  String id;
  String title;

  CatergoryChild.fromJson(Map<String,dynamic> json){
      _id=json['_id'];
      id=json['id'];
      created_at=json['created_at'];
      icon=json['icon'];
      id=json['id'];
      title=json['title'];
  }

}