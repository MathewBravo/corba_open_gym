import 'package:objectbox/objectbox.dart';

@Entity()
class Sets{
  int id;
  int exerciseID;
  String exerciseName;
  int setCount;

  Sets({this.id = 0, required this.exerciseID, required this.exerciseName, this.setCount = 1});
}