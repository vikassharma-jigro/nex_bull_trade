import 'package:dio/dio.dart';
import 'package:logger/web.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../utils/shared_preferences.dart';

class DioClient {
  final Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: "http://priyaapi.zenovaservices.com",
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {"Content-Type": "application/json"},
        ),
      ) {
    dio.interceptors.addAll([
      InterceptorsWrapper(
        /// ================= REQUEST =================
        onRequest: (options, handler) {
          final token =" sp?.getString(SpUtil.ACCESS_TOKEN)";

          Logger().i("Token Get: $token");

          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }

          return handler.next(options);
        },

        /// ================= RESPONSE =================
        onResponse: (response, handler) {
          return handler.next(response);
        },

        /// ================= ERROR =================
        onError: (error, handler) {
          final statusCode = error.response?.statusCode;

          if (statusCode == 401) {
            Logger().e("🔴 401 Unauthorized - Redirecting to Login");

            Future.microtask(() async {
              try {
                // clear token
                //await sp?.remove(SpUtil.ACCESS_TOKEN);

                // get correct GoRouter context
               // final context = AppRouter.navigatorKey.currentContext;

                // if (context == null) {
                //   Logger().e("❌ Navigator context is null");
                //   return;
                // }

                // navigate to login using GoRouter
                //context.go('/login');
              } catch (e) {
                Logger().e("Logout redirect error: $e");
              }
            });
          }

          return handler.next(error);
        },
      ),

      /// ================= LOGGING =================
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
        enabled: true,
        request: true,
        error: true,
      ),
    ]);
  }
}
