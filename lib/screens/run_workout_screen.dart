import 'package:corba_open_gym/main.dart';
import 'package:flutter/material.dart';

import '../models/set.dart';
import '../models/workout.dart';

class RunWorkoutScreen extends StatefulWidget {
  static const routeName = '/run-workout';

  int workOutId;

  RunWorkoutScreen({Key? key, required this.workOutId}) : super(key: key);

  @override
  State<RunWorkoutScreen> createState() => _RunWorkoutScreenState();
}

class _RunWorkoutScreenState extends State<RunWorkoutScreen> {
  List<TextEditingController> _weightController = [];
  List<TextEditingController> _repController = [];
  late int totalSets;
  Workout? workoutBox;
  late Workout fetchedWorkout;

  @override
  void dispose() {
    // TODO: implement dispose
    for (TextEditingController cont in _weightController) {
      cont.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    workoutBox = objectBox.getWorkout(widget.workOutId);
    fetchedWorkout = workoutBox!;
    totalSets = 0;
    for (Sets set in fetchedWorkout.sets) {
      for (int i = 0; i < set.setCount; i++) {
        _weightController.add(TextEditingController());
        _repController.add(TextEditingController());
        totalSets++;
      }
    }
    super.initState();
  }

  Widget setCard(int passedIndex) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(fetchedWorkout.sets[passedIndex].exerciseName),
                Text('Sets: ${fetchedWorkout.sets[passedIndex].setCount}')
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ListView.builder(
                key: ValueKey(totalSets),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: fetchedWorkout.sets[passedIndex].setCount,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            const Text('Weight: '),
                            SizedBox(
                                width: 40,
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _weightController[index],
                                    onFieldSubmitted: (String input) {
                                      print(_weightController[index].text);
                                    })),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Reps: '),
                            SizedBox(
                              width: 40,
                              child: TextFormField(
                                controller: _repController[index],
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (_) {
                                  print(_repController[index].text);
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(fetchedWorkout.name),
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .20,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => setCard(index),
                itemCount: fetchedWorkout.sets.length,
              ),
            ),
          ],
        ));
  }
}
