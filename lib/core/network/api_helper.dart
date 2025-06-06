import 'package:dio/dio.dart';
import 'package:ecommerce_nti/core/helper/app_router.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../cache/ cache_data.dart';
import '../cache/cache_helper.dart';
import '../cache/cache_keys.dart';
import 'api_response.dart';
import 'end_points.dart';

class ApiHelper {
  // singleton
  static final ApiHelper _instance = ApiHelper._init();
  factory ApiHelper() {
    _instance.initDio();
    return _instance;
  }

  ApiHelper._init();
  Dio dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
      )
  );
  void initDio() {
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          print("--- Headers : ${options.headers.toString()}");
          print("--- endpoint : ${options.path.toString()}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("--- Response : ${response.data.toString()}");
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          print("--- Error : ${error.response?.data.toString()}");

          final message = error.response?.data['message'];
          if (message != null && message.contains('expired')) {
            // refresh token
            try {
              ApiResponse apiResponse = await _instance.postRequest(
                endPoint: EndPoints.refreshToken,
                sendRefreshToken: true,
                isProtected: true,
              );

              if (apiResponse.status) {
                CacheData.accessToken = apiResponse.data['access_token'];
                await CacheHelper.saveData(key: CacheKeys.accessToken, value: CacheData.accessToken);

                // Retry original request
                final options = error.requestOptions;

                if (options.data is FormData) {
                  final oldFormData = options.data as FormData;
                  final Map<String, dynamic> formMap = {};

                  for (var entry in oldFormData.fields) {
                    formMap[entry.key] = entry.value;
                  }

                  for (var file in oldFormData.files) {
                    formMap[file.key] = file.value;
                  }

                  options.data = FormData.fromMap(formMap);
                }

                options.headers['Authorization'] = 'Bearer ${CacheData.accessToken}';
                final response = await dio.fetch(options);
                return handler.resolve(response);
              } else {
                // must logout
                CacheHelper.removeData(key: CacheKeys.accessToken);
                CacheHelper.removeData(key: CacheKeys.refreshToken);
                navigatorKey.currentState?.pushReplacementNamed(AppRouter.kLoginView);
                return handler.next(error);
              }
            } catch (e) {
              CacheHelper.removeData(key: CacheKeys.accessToken);
              CacheHelper.removeData(key: CacheKeys.refreshToken);
              navigatorKey.currentState?.pushReplacementNamed(AppRouter.kLoginView);
              return handler.next(error);
            }
          }

          return handler.next(error);
        }
    ));

  }
  Future<ApiResponse> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isProtected = false,
    bool sendRefreshToken = false
  }) async
  {
    return ApiResponse.fromResponse(await dio.post(
        endPoint,
        data: isFormData? FormData.fromMap(data??{}): data,
        options: Options(
            headers:
            {
              if(isProtected) 'Authorization': 'Bearer ${sendRefreshToken? CacheHelper.getData(key: CacheKeys.refreshToken): CacheData.accessToken}',
            }
        )
    ));
  }

  Future<ApiResponse> getRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isProtected = false
  }) async
  {
    return ApiResponse.fromResponse(await dio.get(
        endPoint,
        data: isFormData? FormData.fromMap(data??{}): data,
        options: Options(
            headers:
            {
              if(isProtected) 'Authorization': 'Bearer ${CacheData.accessToken}',
            }
        )
    ));
  }

  Future<ApiResponse> putRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isProtected = false
  }) async
  {
    return ApiResponse.fromResponse(await dio.put(
        endPoint,
        data: isFormData? FormData.fromMap(data??{}): data,
        options: Options(
            headers:
            {
              if(isProtected) 'Authorization': 'Bearer ${CacheData.accessToken}',
            }
        )
    ));
  }

  Future<ApiResponse> deleteRequest({required String endPoint, bool isProtected = false}) async {
    return ApiResponse.fromResponse(
        await dio.delete(
            endPoint,
            options: Options(
                headers: {
                  if (isProtected) 'Authorization': 'Bearer ${CacheData.accessToken}'
                }
            )
        )
    );
  }
}