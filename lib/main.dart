import 'package:clean_architecture/data/repository/picture_api_repository_impl.dart';
import 'package:clean_architecture/presentation/home/home_screen.dart';
import 'package:clean_architecture/presentation/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(PictureApiRepositoryImpl()),
        child: const HomeScreen(),
      ),
    );
  }
}
