import 'package:flutter/material.dart';

class WorkoutCreatorScreen extends StatelessWidget {
  static const routeName = '/workout-creator';

  const WorkoutCreatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Creator'),
      ),
      body: const Center(
        child: Text('Workout Creator'),
      ),
    );
  }
}
