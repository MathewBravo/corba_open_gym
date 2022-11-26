import 'package:corba_open_gym/models/user_settings.dart';
import 'package:objectbox/objectbox.dart';
import '../models/exercises.dart';
import '../objectbox.g.dart';

class ObjectBox {
  late final Store _store;
  late final Box<UserSettings> _userSettingsBox;
  late final Box<Exercise> _exerciseLibrary;

  ObjectBox._init(this._store) {
    _userSettingsBox = Box<UserSettings>(_store);
    _exerciseLibrary = Box<Exercise>(_store);
  }

  static Future<ObjectBox> init() async {
    final store = await openStore();

    return ObjectBox._init(store);
  }

  // UserSettings
  UserSettings? getUserSettings(int id) => _userSettingsBox.get(id);

  int insertNewSettings(UserSettings userSettings) =>
      _userSettingsBox.put(userSettings);

  bool deleteUserSettings(int id) => _userSettingsBox.remove(id);

  //ExerciseLibrary
  Exercise? getExerciseLibrary(int id) => _exerciseLibrary.get(id);

  Query<Exercise> getAllByCategory(String category) =>
      _exerciseLibrary.query(Exercise_.bodyparts.contains(category)).build();

  List<Exercise>? getAllLibrary() => _exerciseLibrary.getAll();

  int insertNewLibrary(Exercise exerciseLibrary) =>
      _exerciseLibrary.put(exerciseLibrary);

  bool deleteExercise(int id) => _exerciseLibrary.remove(id);
}
