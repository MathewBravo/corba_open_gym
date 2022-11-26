import 'package:objectbox/objectbox.dart';

@Entity()
class UserSettings {
  int id;
  double currentUnitOfMeasure;
  double lowestPlate;

  UserSettings({this.id = 0, required this.currentUnitOfMeasure, required this.lowestPlate });
}

