import 'package:corba_open_gym/main.dart';
import 'package:flutter/material.dart';
import 'package:corba_open_gym/models/set.dart';

import '../models/exercises.dart';

class WorkoutCreatorScreen extends StatefulWidget {
  static const routeName = '/workout-creator';

  WorkoutCreatorScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutCreatorScreen> createState() => _WorkoutCreatorScreenState();
}

class _WorkoutCreatorScreenState extends State<WorkoutCreatorScreen> {
  final workoutNameController = TextEditingController();
  List<Exercise>? exerciseList;
  List<String> exerciseNames = [];
  String selectedExercise = '';
  List<Set> setList = [];

  @override
  void initState() {
    // TODO: implement initState
    exerciseList = objectBox.getAllLibrary();
    print(exerciseList!.length);
    for (Exercise exer in exerciseList!) {
      exerciseNames.add(exer.name);
    }
    print(exerciseNames);
    super.initState();
  }

  void _openSearchDialog() => showDialog(
      context: context,
      builder: (context) => Dialog(
            child: Autocomplete<String>(
              fieldViewBuilder: ((context, textEditingController, focusNode,
                  onFieldSubmitted) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    onEditingComplete: onFieldSubmitted,
                    decoration: const InputDecoration(
                        hintText: 'Search Exercise',
                        contentPadding: EdgeInsets.all(8)),
                    onFieldSubmitted: (String selection) {
                      print(selection);
                    },
                  ),
                );
              }),
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return exerciseNames.where((element) => element
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase()));
              },
            ),
          ));

  void addExercise() {
    setState(() {
      setList.add(Set(exerciseID: null, setCount: 0));
      print(setList.length);
    });
  }

  void saveWorkout() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Workout Creator'),
          actions: [
            IconButton(
              onPressed: saveWorkout,
              icon: const Icon(Icons.save),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextFormField(
                  controller: workoutNameController,
                  decoration: const InputDecoration(hintText: 'Workout Name'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => Dismissible(
                  key: UniqueKey(),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      setList.removeAt(index);
                    });
                  },
                  child: const ListTile(title: Text('Text')),
                ),
                itemCount: setList.length,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: _openSearchDialog,
                  child: const Text('Add Exercise'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: saveWorkout,
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
