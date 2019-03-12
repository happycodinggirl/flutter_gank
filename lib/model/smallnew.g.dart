// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smallnew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

smallnew _$smallnewFromJson(Map<String, dynamic> json) {
  return smallnew(json['_id'] as String, json['en_name'] as String,
      json['name'] as String, json['rank'] as int);
}

Map<String, dynamic> _$smallnewToJson(smallnew instance) => <String, dynamic>{
      '_id': instance.id,
      'en_name': instance.en_name,
      'name': instance.name,
      'rank': instance.rank
    };
