import 'package:clean_architecture/data/pixabay_api_provider.dart';
import 'package:clean_architecture/model/Photo.dart';
import 'package:clean_architecture/ui/widget/photo_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = PixabayApiProvider.of(context).viewModel;
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
            child: TextField(
              onSubmitted: (String query) {
                viewModel.fetch(query);
              },
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
          ),
          StreamBuilder<List<Photo>>(
            stream: viewModel.photoStream,
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }

              final photo = snapshot.data!;
              return Expanded(
                child: GridView.builder(
                  itemCount: photo.length,
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return PhotoWidget(data: photo[index]);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
