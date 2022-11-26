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
  late final Query<Exercise> _exercises;
  late final List<Exercise> displayLibrary;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _exercises = objectBox.getAllByCategory(widget.category);
    if(_exercises != null){
      setDisplayLibrary(_exercises);
    }
  }

  void setDisplayLibrary(Query<Exercise> exercises){
    displayLibrary = exercises as List<Exercise>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} Exercises'),
      ),
    );
  }
}
