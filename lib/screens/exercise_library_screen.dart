import 'package:corba_open_gym/main.dart';
import 'package:corba_open_gym/screens/exercise_creation_screen.dart';
import 'package:corba_open_gym/screens/exercise_for_category_screen.dart';
import 'package:corba_open_gym/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import '../models/exercises.dart';

class ExerciseLibraryScreen extends StatefulWidget {
  static const routeName = '/exercise-library';

  const ExerciseLibraryScreen({Key? key}) : super(key: key);

  @override
  State<ExerciseLibraryScreen> createState() => _ExerciseLibraryScreenState();
}

class _ExerciseLibraryScreenState extends State<ExerciseLibraryScreen> {
  final List<String> exerciseTypes = [
    'All',
    'Back',
    'Abs',
    'Traps',
    'Triceps',
    'Forearms',
    'Calves',
    'Front Delts',
    'Glutes',
    'Chest',
    'Biceps',
    'Quads',
    'Hamstrings',
    'Side Delts',
    'Rear Delts',
  ];

  List<Exercise>? _exerciseLibraryFetch;
  late List<Exercise> _exerciseLibrary;

  @override
  void initState() {
    // TODO: implement initState
    _exerciseLibraryFetch = objectBox.getAllLibrary();
    if (_exerciseLibraryFetch != null) {
      _exerciseLibrary = _exerciseLibraryFetch!;
    }
    super.initState();
  }

  List<Exercise> exerciseForCat(String category) {
    if (category == 'All') {
      return _exerciseLibrary;
    } else {
      return _exerciseLibrary
          .where((element) => element.bodyparts.contains(category))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Library'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                exerciseTypes[index],
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExerciseForCategoryScreen(
                            category: exerciseTypes[index],
                            exercises: exerciseForCat(exerciseTypes[index]),
                          )));
            },
          );
        },
        itemCount: exerciseTypes.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ExerciseCreationScreen(
                        exerciseCategories: exerciseTypes,
                        existingExercises: _exerciseLibrary,
                      )));
        },
        tooltip: 'Add Exercise To Library',
        child: const Icon(Icons.add),
      ),
    );
  }
}
