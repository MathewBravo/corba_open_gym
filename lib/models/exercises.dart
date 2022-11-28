import 'package:objectbox/objectbox.dart';

@Entity()
class Exercise {
  int id;
  String name;
  List<String> bodyparts;
  double barWeight;
  bool barInKG;
  bool assisted;

  Exercise(
      {this.id = 0,
      this.assisted = false,
      required this.name,
      required this.barWeight,
      required this.bodyparts,
      required this.barInKG});
}
