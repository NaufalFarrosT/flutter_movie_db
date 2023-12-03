import 'package:yt_flutter_movie_db/config/base_url.dart';
import 'package:dio/dio.dart';

class DioHttp {
  static Map<String, dynamic> headers = {
    "accept": "application/json",
    "Content-Type": 'application/json',
  };

  static Dio request = Dio(
    BaseOptions(baseUrl: baseUrl, headers: headers),
  );
}
