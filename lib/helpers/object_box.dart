import 'package:corba_open_gym/models/user_settings.dart';
import 'package:objectbox/objectbox.dart';
import '../models/exercises.dart';
import '../models/set.dart';
import '../models/workout.dart';
import '../objectbox.g.dart';

class ObjectBox {
  late final Store _store;
  late final Box<UserSettings> _userSettingsBox;
  late final Box<Exercise> _exerciseLibrary;
  late final Box<Sets> _setBox;
  late final Box<Workout> _workoutBox;

  ObjectBox._init(this._store) {
    _userSettingsBox = Box<UserSettings>(_store);
    _exerciseLibrary = Box<Exercise>(_store);
    _workoutBox = Box<Workout>(_store);
    _setBox = Box<Sets>(_store);
  }

  static Future<ObjectBox> init() async {
    final store = await openStore();

    return ObjectBox._init(store);
  }

  // UserSettings
  UserSettings? getUserSettings(int id) => _userSettingsBox.get(id);

  List<UserSettings> getAllSettings() => _userSettingsBox.getAll();

  int insertNewSettings(UserSettings userSettings) =>
      _userSettingsBox.put(userSettings);

  bool deleteUserSettings(int id) => _userSettingsBox.remove(id);

  //ExerciseLibrary
  Exercise? getExerciseLibrary(int id) => _exerciseLibrary.get(id);

  List<Exercise> getExerciseByCategory(String category) => _exerciseLibrary
      .query(Exercise_.bodyparts.contains(category))
      .build()
      .find();

  List<Exercise>? getAllLibrary() => _exerciseLibrary.getAll();

  List<int> addDefaultExercises(List<Exercise> exercises) =>
      _exerciseLibrary.putMany(exercises);

  int insertNewExercise(Exercise exercise) => _exerciseLibrary.put(exercise);

  bool deleteExercise(int id) => _exerciseLibrary.remove(id);

  int deleteAllLibrary() => _exerciseLibrary.removeAll();

  //SetBox
  Sets? getSet(int id) => _setBox.get(id);

  List<Sets>? getAllSets() => _setBox.getAll();

  List<int> addWorkoutSets(List<Sets> sets) => _setBox.putMany(sets);

  int insertNewSet(Sets sets) => _setBox.put(sets);

  bool deleteSet(int id) => _setBox.remove(id);

  int deleteSetForWorkout(List<int> ids) => _setBox.removeMany(ids);

  int deleteAllSets() => _setBox.removeAll();

  //Workout
  Workout? getWorkout(int id) => _workoutBox.get(id);

  List<Workout>? getAllWorkouts() => _workoutBox.getAll();

  int insertNewWorkout(Workout workout) => _workoutBox.put(workout);

  int deleteAllWorkouts() => _workoutBox.removeAll();

  bool deleteWorkout(int id) => _workoutBox.remove(id);
}
