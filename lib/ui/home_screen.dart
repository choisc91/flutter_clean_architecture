import 'package:clean_architecture/data/api_provider.dart';
import 'package:clean_architecture/model/Photo.dart';
import 'package:clean_architecture/widget/photo_widget.dart';
import 'package:flutter/material.dart';

// 작업 #1. 기존 PixabayApi 인스턴스를 HomeScreen 이 가지고 있어 페이지 자체가 Api 없이는 돌아가지 않아,
// 외부에서 페이지를 생성하는 시점에 인스턴스를 전달해 줌으로서 이 둘의 의존성을 분리.

// 작업 #2. PixabayApi 인스턴스를 Main 에서 생성하여  던지는 것으로 분리를 하였지만,
// 이렇게 되면 itemWidget 쪽이나 다른 추후 페이지에서 또 PixabayApi 를 필요로 할 경우
// 계속해서 생성자로 던져주어야 하기 때문에 depth 가 깊어지는 혐오스러운 일이 발생.
// InheritedWidget 를 사용하여 BuildContext 가 가지는 가장 가까운 PixabayApiProvider 를
// 제공해 줌으로서, Depth 가 깊어지는 것을 미연에 방지.

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
            child: _buildTextFiled(context),
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
  Widget _buildTextFiled(BuildContext context) {
    return TextField(
      onSubmitted: (String query) => _onSubmitted(query, context),
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }

  //
  void _onSubmitted(String query, BuildContext context) async {
    final pixabayApiProvider = PixabayApiProvider.of(context);
    final photos = await pixabayApiProvider.pixabayApi.fetch(query);
    setState(() {
      _photos = photos;
    });
  }
}
