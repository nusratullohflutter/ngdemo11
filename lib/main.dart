import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ngdemo11/pages/home_page.dart';
import 'package:ngdemo11/pages/post_page.dart';
import 'package:ngdemo11/service/root_service.dart';
import 'package:ngdemo11/service/sql_service.dart';
import 'package:path_provider/path_provider.dart';
import 'model/member_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RootService.init();
  await SqlService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PostPage(),
    );
  }
}
