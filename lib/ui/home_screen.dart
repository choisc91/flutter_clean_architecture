import 'dart:convert';

import 'package:clean_architecture/model/Photo.dart';
import 'package:clean_architecture/widget/photo_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Photo> _photos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search for images'),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
        centerTitle: true,
        elevation: .0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildTextFiled(),
          ),
          Expanded(
            child: _buildGridView(),
          )
        ],
      ),
    );
  }

  //
  Widget _buildGridView() {
    return GridView.builder(
      itemCount: _photos.length,
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return PhotoWidget(data: _photos[index]);
      },
    );
  }

  //
  Widget _buildTextFiled() {
    return TextField(
      onSubmitted: _onSubmitted,
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }

  //
  void _onSubmitted(String query) async {
    final photos = await fetch(query);
    setState(() {
      _photos = photos;
    });
  }

  //
  Future<List<Photo>> fetch(String query) async {
    final uri = Uri.parse(
        'https://pixabay.com/api/?key=26131079-5bca26675953d8e1029c3e88e&q=$query&image_type=photo');
    final response = await http.get(uri);
    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    final Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
