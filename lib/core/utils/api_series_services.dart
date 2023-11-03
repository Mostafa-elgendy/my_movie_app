import 'package:dio/dio.dart';

class ApiSeriesService {
  final _baseUrl = "https://api.themoviedb.org/3/tv/";
  static const apiKEY = "82f3dc217dca60ae08bb4a9337d789a9";
  final Dio dio;

  ApiSeriesService(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    // print('$_baseUrl$endPoint&api_key=$apiKEY');
    var response = await dio.get('$_baseUrl$endPoint&api_key=$apiKEY');
    return response.data;
  }

  Future<Map<String, dynamic>> getSimilar({required int serieId}) async {
    //  print('$_baseUrl$endPoint');
    String similar = "serie/$serieId/similar?api_key=$apiKEY";
    var response = await dio.get('$_baseUrl$similar');
    return response.data;
  }

  Future<Map<String, dynamic>> getActors({required int serieId}) async {
    String actors = "serie/$serieId/casts?api_key=$apiKEY";
    //print('$_baseUrl$actors');
    var response = await dio.get('$_baseUrl$actors');
    return response.data;
  }
}
