import 'package:corba_open_gym/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class ExerciseLibraryScreen extends StatelessWidget {
  static const routeName = '/exercise-library';
  const ExerciseLibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Library'),
      ),
      drawer: MainDrawer(),
      body: const Center(
        child: ListView.builder(itemBuilder: itemBuilder, itemCount: 0,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Add Exercise To Library',
        child: const Icon(Icons.add),
      ),
    );
  }
}
