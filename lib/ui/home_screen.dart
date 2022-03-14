import 'package:clean_architecture/data/api_provider.dart';
import 'package:clean_architecture/model/Photo.dart';
import 'package:clean_architecture/widget/photo_widget.dart';
import 'package:flutter/material.dart';

// 작업 #1.
// 기존 PixabayApi 인스턴스를 HomeScreen 이 가지고 있어 페이지 자체가 Api 없이는 돌아가지 않아,
// 외부에서 페이지를 생성하는 시점에 인스턴스를 전달해 줌으로서 이 둘의 의존성을 분리.

// 작업 #2.
// PixabayApi 인스턴스를 Main 에서 생성하여  던지는 것으로 분리를 하였지만,
// 이렇게 되면 itemWidget 쪽이나 다른 추후 페이지에서 또 PixabayApi 를 필요로 할 경우
// 계속해서 생성자로 던져주어야 하기 때문에 depth 가 깊어지는 혐오스러운 일이 발생.
// InheritedWidget 를 사용하여 BuildContext 가 가지는 가장 가까운 PixabayApiProvider 를
// 제공해 줌으로서, Depth 가 깊어지는 것을 미연에 방지.

// 작업 #3.
// 기존 PixabayApi 에서 작업이 끝낸 데이터를, HomeScreen 이 가지고 있는 변수에 담아
// 상태를 새로 고침하여 표시하고 있었으나, PixabayProvider 가 자체적으로 Stream data 를
// 가지도록 하고, Provider 쪽에서 네트워크 함수 처리와 동시에 Stream 데이터를 갱신 함으로서
// Home screen 은 Stream builder 를 통해, 변화만 감지하도록 수정.
// 이로서 HomeScreen 의 상태 Widget 도 기존 StatefulWidget 에서 StatelessWidget 변경.

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pixabayApiProvider = PixabayApiProvider.of(context);
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
                pixabayApiProvider.fetch(query);
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
            stream: pixabayApiProvider.photoStream,
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
