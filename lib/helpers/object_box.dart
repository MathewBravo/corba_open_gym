import 'package:corba_open_gym/models/user_settings.dart';
import '../objectbox.g.dart';

class ObjectBox {
  late final Store _store;
  late final Box<UserSettings> _userSettingsBox;



  ObjectBox._init(this._store){
    _userSettingsBox = Box<UserSettings>(_store);
  }

  static Future<ObjectBox> init () async {
    final store = await openStore();

    return ObjectBox._init(store);
  }

  UserSettings? getUserSettings(int id) => _userSettingsBox.get(id);

  int insertNewSettings(UserSettings userSettings) => _userSettingsBox.put(userSettings);

  bool deleteUserSettings(int id) => _userSettingsBox.remove(id);
}