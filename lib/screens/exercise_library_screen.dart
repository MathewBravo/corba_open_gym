import 'package:corba_open_gym/screens/exercise_creation_screen.dart';
import 'package:corba_open_gym/screens/exercise_for_category_screen.dart';
import 'package:corba_open_gym/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class ExerciseLibraryScreen extends StatelessWidget {
  static const routeName = '/exercise-library';

  List<String> exerciseTypes = [
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

  ExerciseLibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Library'),
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
                          category: exerciseTypes[index])));
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
                      )));
        },
        tooltip: 'Add Exercise To Library',
        child: const Icon(Icons.add),
      ),
    );
  }
}
