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
      setList.add(Set(exerciseName: name, setCount: 0, exerciseID: id));
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
                  child: ListTile(
                    leading: SizedBox(
                      width: MediaQuery.of(context).size.width * .75,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(setList[index].exerciseName),
                            Text('Sets: ${setList[index].setCount.toString()}'),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  setList[index].setCount++;
                                });
                              },
                              icon: const Icon(Icons.add),
                            )
                          ],
                        ),
                      ),
                    ),
                    trailing: setList[index].setCount > 0
                        ? IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_drop_down),
                          )
                        : const SizedBox(),
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
