import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app1/model/smallnew.dart';

part 'big.g.dart';

@JsonSerializable()
class big{


  bool error;
  List<smallnew> results;
  factory big.fromJson(Map<String, dynamic> json) => _$bigFromJson(json);
  Map<String, dynamic> toJson() => _$bigToJson(this);

  big(this.error, this.results);

  @override
  String toString() {
    return 'big{error: $error, results: $results}';
  }


}