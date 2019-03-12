// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'big.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

big _$bigFromJson(Map<String, dynamic> json) {
  return big(
      json['error'] as bool,
      (json['results'] as List)
          ?.map((e) =>
              e == null ? null : smallnew.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$bigToJson(big instance) =>
    <String, dynamic>{'error': instance.error, 'results': instance.results};
