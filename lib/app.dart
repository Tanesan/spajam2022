import 'package:flutter/material.dart';
import 'package:spajam2022/ui/styles/app_color.dart';

import 'ui/pages/my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: AppColor.primary,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
