import 'package:json_annotation/json_annotation.dart';

// part 'navermap_model.g.dart';

@JsonSerializable()
class NavermapModel {
  final String name;

  // final int id;
  // final String title;
  // final String type;
  // final String url;

  NavermapModel({
    required this.name,
    //   required this.title,
    //   required this.type,
    //   required this.url,
  });

  // factory NewsModel.fromJson(Map<String, dynamic> json) =>
  //     _$NewsModelFromJson(json);

  // Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}

@JsonSerializable()
class Region {
  final List<Area> areaList;

  Region({
    required this.areaList,
  });
}

@JsonSerializable()
class Area {
  final String name;

  Area({
    required this.name

  });
}
