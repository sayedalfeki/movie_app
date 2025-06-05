import 'package:dio/dio.dart';
import 'api_endpoints.dart';
class ApiManager
{
  late Dio dio;
  ApiManager._()
  {
    dio=Dio(
      BaseOptions(
        baseUrl:ApiEndPoints.baseUrl,
        validateStatus: (status) {
          return true;
        },
      )
    );
  }
  static ApiManager? _instance;
  static ApiManager get instance
  {
    _instance ??= ApiManager._();
    return _instance!;
  }
 Future<Response> get(String path,Map<String,dynamic> queryParams)async
 {
   return await dio.get(path,queryParameters: queryParams);
 }
  Future<Response> post(String path,{Object? data})async
  {
    return await dio.post(path,data: data);
  }
  Future<Response> put(String path,{Object? data})async
  {
    return await dio.put(path,data: data);
  }
}