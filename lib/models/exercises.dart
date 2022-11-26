import 'package:objectbox/objectbox.dart';

@Entity()
class Exercise {
  int id;
  String name;
  List<String> bodyparts;
  double barWeight;
  bool barInKG;

  Exercise(
      {this.id = 0,
      required this.name,
      required this.barWeight,
      required this.bodyparts,
      required this.barInKG});
}
