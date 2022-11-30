import 'package:corba_open_gym/main.dart';
import 'package:corba_open_gym/screens/run_workout_screen.dart';
import 'package:corba_open_gym/screens/workout_creator_screen.dart';
import 'package:corba_open_gym/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import '../models/workout.dart';

class WorkoutsScreen extends StatefulWidget {
  static const routeName = '/workouts';

  const WorkoutsScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  List<Workout> _workoutLibrary = [];
  List<Workout>? _workoutBox;

  @override
  void initState() {
    // TODO: implement initState
    _workoutBox = objectBox.getAllWorkouts();
    _workoutLibrary = _workoutBox!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Workouts'),
      ),
      body: _workoutLibrary.length == 0
          ? const Center(
              child: Text('No Workouts'),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_workoutLibrary[index].name),
                  trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RunWorkoutScreen(workOutId: _workoutLibrary[index].id,)));
                      },
                      child: const Text('Run Workout')),
                );
              },
              itemCount: _workoutLibrary.length,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: remove this before release
          // objectBox.deleteAllWorkouts();
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WorkoutCreatorScreen()))
              .then((_) => setState(() {
                    print("Pop");
                    _workoutBox = objectBox.getAllWorkouts();
                    _workoutLibrary = _workoutBox!;
                  }));
        },
        tooltip: 'Add A New Workout',
        child: const Icon(Icons.add),
      ),
    );
  }
}
