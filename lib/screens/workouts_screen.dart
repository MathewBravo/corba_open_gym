import 'package:corba_open_gym/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class WorkoutsScreen extends StatelessWidget {
  static const routeName = '/workouts';
  const WorkoutsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Workouts'),
      ),
      body: const Center(
        child: Text('Workouts'),
      ),
     floatingActionButton: FloatingActionButton(
       onPressed: () {
         print('clicked add new');
       },
       tooltip: 'Add A New Workout',
       child: const Icon(Icons.add),
     ),
    );
  }
}
