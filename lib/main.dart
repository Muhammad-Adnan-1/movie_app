import 'package:flutter/material.dart';
import 'package:movies_app/app/routes/routes.dart';
import 'package:movies_app/app/themes/light_theme.dart';
import 'package:movies_app/shared/app_providers.dart';
import 'package:provider/provider.dart';



//movie api key: 452d46c3f651ffd4c44ea11f643798ef

void main() async {

  runApp(
      MultiProvider(providers: providers, child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Movies App',
      theme: lightTheme,
      routerConfig: router,
    );
  }
}