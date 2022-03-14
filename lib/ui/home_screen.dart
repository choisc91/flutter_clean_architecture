import 'package:clean_architecture/data/api.dart';
import 'package:clean_architecture/model/Photo.dart';
import 'package:clean_architecture/widget/photo_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pixabayApi = PixabayApi();

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
    final photos = await _pixabayApi.fetch(query);
    setState(() {
      _photos = photos;
    });
  }
}
