import 'package:clean_architecture/data/data_source/pixabay_api.dart';
import 'package:clean_architecture/data/repository/picture_api_repository_impl.dart';
import 'package:clean_architecture/domain/repository/pixabay_api_repository.dart';
import 'package:clean_architecture/domain/use_case/get_pictures_use_case.dart';
import 'package:clean_architecture/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:http/http.dart' as http;

// 1. Provider 전체.
List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

// 2. 독립적인 객체.
List<SingleChildWidget> independentModels = [
  Provider<http.Client>(
    create: (context) => http.Client(),
  ),
];

// 3. 2번에 의존성이 있는 객체들.
List<SingleChildWidget> dependentModels = [
  ProxyProvider<http.Client, PixabayApi>(
    update: (context, client, _) => PixabayApi(client),
  ),
  ProxyProvider<PixabayApi, PixabayApiRepository>(
    update: (context, api, _) => PictureApiRepositoryImpl(api),
  ),
  ProxyProvider<PixabayApiRepository, GetPicturesUseCase>(
    update: (context, repository, _) => GetPicturesUseCase(repository),
  ),
];

// 4, 뷰모델.
List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<HomeViewModel>(
    create: (context) => HomeViewModel(context.read<GetPicturesUseCase>()),
  ),
];
