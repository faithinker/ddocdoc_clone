// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navermap_network_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _NaverMapNetworkService implements NaverMapNetworkService {
  _NaverMapNetworkService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<NaverMapModel> getTasks({
    String keyId = 'qyfcvnrnq8',
    String key = '195ciZHEgf8gtguBzuu4nJ1GTIurCxUaRxqYCGJ0',
    required String position,
    String output = 'json',
    String orders = 'legalcode',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'coords': position,
      r'output': output,
      r'orders': orders,
    };
    final _headers = <String, dynamic>{
      r'X-NCP-APIGW-API-KEY-ID': keyId,
      r'X-NCP-APIGW-API-KEY': key,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<NaverMapModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/gc',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = NaverMapModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
