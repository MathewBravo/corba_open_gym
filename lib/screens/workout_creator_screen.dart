import 'package:corba_open_gym/main.dart';
import 'package:corba_open_gym/models/workout.dart';
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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

  // Widget setCard()

  void _openSearchDialog() => showDialog(
      context: context,
      builder: (context) => Dialog(
            child: Autocomplete<String>(
              fieldViewBuilder: ((context, textEditingController, focusNode,
                  onFieldSubmitted) {
                FocusScope.of(context).requestFocus(focusNode);
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
                      searchSubmissionHandler(selection);
                      Navigator.pop(context);
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

  void searchSubmissionHandler(String selection) {
    int selectedID =
        exerciseList!.indexWhere((element) => element.name == selection);
    addExercise(selectedID, selection);
  }

  void addExercise(int id, String name) {
    setState(() {
      setList.add(Set(exerciseName: name, exerciseID: id));
    });
  }

  void saveWorkout() {
    Workout testWork = Workout(name: workoutNameController.text, sets: setList);
    print("${testWork.name} ");
  }
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
                  key: ValueKey(setList),
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      setList.removeAt(index);
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: Column(
                        children: [
                          Text(setList[index].exerciseName),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Sets'),
                              const SizedBox(
                                width: 30,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        setList[index].setCount++;
                                      });
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                  const SizedBox(width: 5),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (setList[index].setCount > 0) {
                                          setList[index].setCount--;
                                        }
                                      });
                                    },
                                    icon: const Icon(Icons.remove),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                  flex: 4,
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 35.0),
                                        child: Text(setList[index]
                                            .setCount
                                            .toString()),
                                      ))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
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
