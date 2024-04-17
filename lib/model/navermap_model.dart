import 'package:json_annotation/json_annotation.dart';

part 'navermap_model.g.dart';

@JsonSerializable()
class NaverMapModel {
  final Status status;
  final List<Result> results;

  NaverMapModel({
    required this.status,
    required this.results,
  });

  factory NaverMapModel.fromJson(Map<String, dynamic> json) =>
      _$NaverMapModelFromJson(json);

  Map<String, dynamic> toJson() => _$NaverMapModelToJson(this);
}

@JsonSerializable()
class Status {
  final int code;
  final String name;
  final String message;

  Status({required this.code, required this.name, required this.message});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class Result {
  final Region region;

  Result({required this.region});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Region {
  final Area area1;
  final Area area2;
  final Area area3;

  Region({
    required this.area1,
    required this.area2,
    required this.area3,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);
}

@JsonSerializable()
class Area {
  final String name;

  Area({required this.name});

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);

  Map<String, dynamic> toJson() => _$AreaToJson(this);
}
