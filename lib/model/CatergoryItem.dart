class CategoryItem{
  String _id;
  String en_name;
  String name;
  int rank;

  CategoryItem.fromJson(Map<String,dynamic> json):
        _id=json['_id'],
        en_name=json['en_name'],
        name=json['name'],
        rank=json['rank'];

  @override
  String toString() {
    return 'CategoryItem{_id: $_id, en_name: $en_name, name: $name, rank: $rank}';
  }


}