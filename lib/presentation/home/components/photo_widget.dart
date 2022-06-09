import 'package:clean_architecture/domain/model/picture.dart';
import 'package:flutter/material.dart';

class PhotoWidget extends StatelessWidget {
  final Picture data;

  const PhotoWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(data.largeImageURL),
        ),
      ),
    );
  }
}
