import 'package:json_annotation/json_annotation.dart';

part 'smallnew.g.dart';

@JsonSerializable()
class smallnew{

  @JsonKey(name:"_id")//注意这个地方，服务端返回的字段是_id,但如果直接用String _id，而不加以处理的话，是生成不了smallnew.g.dart的，只能如此处处理。
  String id;
  String en_name;
  String name;
  int rank;
  factory smallnew.fromJson(Map<String, dynamic> json) => _$smallnewFromJson(json);
  Map<String, dynamic> toJson() => _$smallnewToJson(this);

  smallnew(this.id, this.en_name, this.name, this.rank);

  @override
  String toString() {
    return 'smallnew{_id: $id, en_name: $en_name, name: $name, rank: $rank}';
  }


}