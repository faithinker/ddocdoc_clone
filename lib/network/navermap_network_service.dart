import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../model/navermap_model.dart';

part 'navermap_network_service.g.dart';

@RestApi(baseUrl: 'https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2')
abstract class NaverMapNetworkService {
  factory NaverMapNetworkService(Dio dio, {String? baseUrl}) =
      _NaverMapNetworkService;

  @GET('/gc')
  Future<NaverMapModel> getTasks({
    @Header('X-NCP-APIGW-API-KEY-ID') String keyId = 'qyfcvnrnq8',
    @Header('X-NCP-APIGW-API-KEY')
    String key = '195ciZHEgf8gtguBzuu4nJ1GTIurCxUaRxqYCGJ0',
    @Query('coords') required String position,
    @Query('output') String output = 'json',
    @Query('orders') String orders = 'admcode',
  });
}
