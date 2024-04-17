// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navermap_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NaverMapModel _$NaverMapModelFromJson(Map<String, dynamic> json) =>
    NaverMapModel(
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NaverMapModelToJson(NaverMapModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      code: json['code'] as int,
      name: json['name'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'message': instance.message,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      region: Region.fromJson(json['region'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'region': instance.region,
    };

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      area1: Area.fromJson(json['area1'] as Map<String, dynamic>),
      area2: Area.fromJson(json['area2'] as Map<String, dynamic>),
      area3: Area.fromJson(json['area3'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'area1': instance.area1,
      'area2': instance.area2,
      'area3': instance.area3,
    };

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      name: json['name'] as String,
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'name': instance.name,
    };
