import 'package:flutter/material.dart';
import '../models/exercises.dart';

class ExerciseCreationScreen extends StatefulWidget {
  final List<String> exerciseCategories;

  const ExerciseCreationScreen({Key? key, required this.exerciseCategories})
      : super(key: key);

  static const List<Widget> unitsOfMeasure = <Widget>[
    Text('KG'),
    Text('LBS'),
  ];

  @override
  State<ExerciseCreationScreen> createState() => _ExerciseCreationScreenState();
}

class _ExerciseCreationScreenState extends State<ExerciseCreationScreen> {
  final _exerciseNameController = TextEditingController();
  final _barWeightController = TextEditingController();
  late bool barInKG = false;
  Exercise createdExercise =
      Exercise(name: '', barWeight: 45.0, bodyparts: [''], barInKG: false);
  final List<bool> _selectedUnitOfMeasure = <bool>[false, true];
  final List<String> _filters = <String>[];

  @override
  void dispose() {
    _exerciseNameController.dispose();
    _barWeightController.dispose();
    super.dispose();
  }

  void setUnitOfMeasure(index) {
    if (index == 0) {
      barInKG = true;
    } else {
      barInKG = false;
    }
    setState(() {
      for (int i = 0; i < _selectedUnitOfMeasure.length; i++) {
        _selectedUnitOfMeasure[i] = i == index;
      }
    });
  }

  void addExerciseToLibrary() {
    createdExercise.name = _exerciseNameController.text;
    createdExercise.barWeight = double.parse(_barWeightController.text);
    createdExercise.barInKG = barInKG;
    _filters.add('All');
    createdExercise.bodyparts = _filters;
    print(
        '${createdExercise.name}, ${createdExercise.barWeight}, ${createdExercise.barInKG}, ${createdExercise.bodyparts}');
  }

  Iterable<Widget> get actorWidgets {
    return widget.exerciseCategories.map((String exerciseName) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(exerciseName),
          selected: _filters.contains(exerciseName),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filters.add(exerciseName);
              } else {
                _filters.removeWhere((String name) {
                  return name == exerciseName;
                });
              }
            });
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Exercise'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration:
                  const InputDecoration(hintText: 'Enter Exercise Name'),
              controller: _exerciseNameController,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .33,
                  child: TextFormField(
                    controller: _barWeightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Bar Weight'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ToggleButtons(
                        onPressed: (int index) {
                          setUnitOfMeasure(index);
                        },
                        isSelected: _selectedUnitOfMeasure,
                        constraints: const BoxConstraints(
                          minWidth: 80,
                          minHeight: 40,
                        ),
                        children: ExerciseCreationScreen.unitsOfMeasure),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Text('Add to: ${_filters.join(', ')}'),
                Wrap(
                  children: actorWidgets.toList(),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 55,
                    width: 225,
                    child: ElevatedButton(
                        onPressed: addExerciseToLibrary,
                        child: const Text(
                          'Add To Library',
                          style: TextStyle(fontSize: 25),
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
