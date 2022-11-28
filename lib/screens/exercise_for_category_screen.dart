import 'package:corba_open_gym/objectbox.g.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../models/exercises.dart';

class ExerciseForCategoryScreen extends StatelessWidget {
  final String category;
  final List<Exercise> exercises;

  const ExerciseForCategoryScreen(
      {Key? key, required this.exercises, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Exercises'),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) =>
              ListTile(
                title: Text(exercises[index].name),
                onTap: () {
                  print(exercises[index].id);
                },
              ),
          itemCount: exercises.length,
        ),
      ),
    );
  }
}
