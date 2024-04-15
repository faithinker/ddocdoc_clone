import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

// part 'navermap_network_service.g.dart';

// @RestApi(
//     baseUrl: 'https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc')
// abstract class NaverMapNetworkService {
//   factory MapClient(Dio dio, {String baseurl}) = _MapClient;

//   @GET('/coords/{position}')
//   @Header(<String, String> {
//       'X-NCP-APIGW-API-KEY-ID' : 'qyfcvnrnq8',
//       'X-NCP-APIGW-API-KEY' : '195ciZHEgf8gtguBzuu4nJ1GTIurCxUaRxqYCGJ0',
//     })
//   Future<List<Map>> getTasks(@Path() String position);


//   @JsonSerializable()
//   class Map {
//     const Map({})
//   }
// }
