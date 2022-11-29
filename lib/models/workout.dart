import 'package:corba_open_gym/models/set.dart';
class Workout {
  int id;
  String name;
  List<Set> sets;

  Workout({this.id = 0, required this.name, required this.sets});
}
