import 'package:clean_architecture/data/pixabay_api.dart';
import 'package:clean_architecture/data/pixabay_api_provider.dart';
import 'package:clean_architecture/ui/home_screen.dart';
import 'package:clean_architecture/ui/home_view_model.dart';
import 'package:flutter/material.dart';

// MVVM 작업 #1.
// 기존 PixabayApi 인스턴스를 HomeScreen 이 가지고 있어 페이지 자체가 Api 없이는 돌아가지 않아,
// 외부에서 페이지를 생성하는 시점에 인스턴스를 전달해 줌으로서 이 둘의 의존성을 분리.

// MVVM 작업 #2.
// PixabayApi 인스턴스를 Main 에서 생성하여  던지는 것으로 분리를 하였지만,
// 이렇게 되면 itemWidget 쪽이나 다른 추후 페이지에서 또 PixabayApi 를 필요로 할 경우
// 계속해서 생성자로 던져주어야 하기 때문에 depth 가 깊어지는 혐오스러운 일이 발생.
// InheritedWidget 를 사용하여 BuildContext 가 가지는 가장 가까운 PixabayApiProvider 를
// 제공해 줌으로서, Depth 가 깊어지는 것을 미연에 방지.

// MVVM 작업 #3.
// 기존 PixabayApi 에서 작업이 끝낸 데이터를, HomeScreen 이 가지고 있는 변수에 담아
// 상태를 새로 고침하여 표시하고 있었으나, PixabayProvider 가 자체적으로 Stream data 를
// 가지도록 하고, Provider 쪽에서 네트워크 함수 처리와 동시에 Stream 데이터를 갱신 함으로서
// Home screen 은 Stream builder 를 통해, 변화만 감지하도록 수정 함으로서,
// HomeScreen 은 오롯이 화면에 관한 코드만 가지게 있도록 됐음.
// 그리고 HomeScreen 의 상태 Widget 도 기존 StatefulWidget 에서 StatelessWidget 변경.

// MVVM 작업 #4.
// PixabayAPi 에서 관리 되고 있는 Stream 구문들을 별도의 view model class 로
// 분기 처리하여 MVVM 패턴 적용, 또 pixabay api class 가 pixabay api repository 를 상속하게 함으로서,
// 기능 과 정의를 구분하여 관리하도록 하며, 이를 테스트 코드를 작성해 확인 함.

// MVVM 작업 #5.
// Mockito 를 활용한 http Client 가짜 데이터 생성 및 이를 활용한 테스트 환경 구축.

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
      home: PixabayApiProvider(
        viewModel: HomeViewModel(PixabayApi()),
        child: const HomeScreen(),
      ),
    );
  }
}
