import 'package:corba_open_gym/models/set.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Workout {
  int id;
  String name;

  final sets = ToMany<Sets>();

  Workout({this.id = 0, required this.name});
}
