import 'package:corba_open_gym/screens/exercise_library_screen.dart';
import 'package:corba_open_gym/screens/home_screen.dart';
import 'package:corba_open_gym/screens/how_to_screen.dart';
import 'package:corba_open_gym/screens/plan_maker_screen.dart';
import 'package:corba_open_gym/screens/user_settings_screen.dart';
import 'package:corba_open_gym/screens/workout_creator_screen.dart';
import 'package:corba_open_gym/screens/workouts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'helpers/object_box.dart';
import 'models/exercises.dart';
import 'helpers/default_exercises.dart';

late ObjectBox objectBox;
late final List<Exercise> defaultExercises;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.init();
  late final List<Exercise>? _checkPopulation;
  objectBox.deleteAllLibrary();
  // TODO: FINISH DEFAULT LIST
  _checkPopulation = objectBox.getAllLibrary();
  // if (_checkPopulation!.isEmpty) {
  //   defaultExercises = DEFAULT_EXERCISES;
  //   objectBox.addDefaultExercises(defaultExercises);
  // }else{
  print(_checkPopulation?.length);
  // }
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 18),
          )),
      home: const HomeScreen(),
      routes: {
        UserSettingsScreen.routeName: (ctx) => const UserSettingsScreen(),
        WorkoutsScreen.routeName: (ctx) => const WorkoutsScreen(),
        PlanMakerScreen.routeName: (ctx) => const PlanMakerScreen(),
        WorkoutCreatorScreen.routeName: (ctx) => const WorkoutCreatorScreen(),
        HowToScreen.routeName: (ctx) => const HowToScreen(),
        ExerciseLibraryScreen.routeName: (ctx) => ExerciseLibraryScreen(),
      },
    );
  }
}
