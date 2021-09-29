import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:iqapp/pages/home_page.dart';
import 'package:iqapp/providers/main_provider.dart';
import 'package:iqapp/providers/theme_provider.dart';
import 'package:iqapp/services/base_service.dart';
import 'package:iqapp/util/constants.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Dio _dio = Dio()..interceptors.add(CustomInterceptor());
    _dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: BASE_URL)).interceptor);

    final BaseService _baseService = BaseService(_dio);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainProvider(_baseService),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) => MaterialApp(
          title: 'IQ Shop',
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.teal,
          ),
          themeMode: value.theme,
          theme: ThemeData(
              primarySwatch: Colors.teal,
              cardTheme: CardTheme(shadowColor: Colors.black45)),
          home: BasePage(),
        ),
      ),
    );
  }
}

class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
