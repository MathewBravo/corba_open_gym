import 'package:corba_open_gym/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class ExerciseLibraryScreen extends StatelessWidget {
  static const routeName = '/exercise-library';
  List<String> exerciseTypes = [
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
              print(exerciseTypes[index]);
            },
          );
        },
        itemCount: exerciseTypes.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Exercise To Library',
        child: const Icon(Icons.add),
      ),
    );
  }
}
