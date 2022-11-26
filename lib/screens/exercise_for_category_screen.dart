import 'package:flutter/material.dart';

class ExerciseForCategoryScreen extends StatelessWidget {
  final String category;
  const ExerciseForCategoryScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category),),
    );
  }
}
