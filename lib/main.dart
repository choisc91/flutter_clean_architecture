import 'package:clean_architecture/data/repository/picture_api_repository_impl.dart';
import 'package:clean_architecture/di/provider_setup.dart';
import 'package:clean_architecture/domain/use_case/get_pictures_use_case.dart';
import 'package:clean_architecture/presentation/home/home_screen.dart';
import 'package:clean_architecture/presentation/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: globalProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image search app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
