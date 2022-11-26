import 'package:corba_open_gym/models/exercises.dart';
import 'package:objectbox/objectbox.dart';


class ExerciseLibrary{
  int id;
  Exercise exercises;
  ExerciseLibrary({this.id = 0, required this.exercises});
}