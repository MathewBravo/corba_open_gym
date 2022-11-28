import 'package:corba_open_gym/objectbox.g.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../models/exercises.dart';

class ExerciseForCategoryScreen extends StatefulWidget {
  final String category;

  const ExerciseForCategoryScreen({Key? key, required this.category})
      : super(key: key);

  @override
  State<ExerciseForCategoryScreen> createState() =>
      _ExerciseForCategoryScreenState();
}

class _ExerciseForCategoryScreenState extends State<ExerciseForCategoryScreen> {
  late final List<Exercise> _exercises;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _exercises = objectBox.getExerciseByCategory(widget.category);

    if (_exercises != null) {
      setDisplayLibrary(_exercises);
    }
  }

  void setDisplayLibrary(List<Exercise> exercises) {
    print(exercises.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} Exercises'),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) =>
              ListTile(title: Text(_exercises[index].name)),
          itemCount: _exercises.length,
        ),
      ),
    );
  }
}
