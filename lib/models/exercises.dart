import 'package:corba_open_gym/objectbox.g.dart';

@Entity()
class Exercise {
  String name;
  List<String> bodyparts;
  double barWeight;
  Exercise({required this.name, required this.barWeight, required this.bodyparts});
}
