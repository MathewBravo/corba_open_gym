import 'package:corba_open_gym/main.dart';
import 'package:corba_open_gym/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import '../models/user_settings.dart';

class UserSettingsScreen extends StatefulWidget {
  static const routeName = '/user-settings';

  const UserSettingsScreen({Key? key}) : super(key: key);

  static const List<Widget> unitsOfMeasure = <Widget>[
    Text('KG'),
    Text('LBS'),
  ];

  static const List<Widget> availablePlates = <Widget>[
    Text('2.5'),
    Text('5.0'),
  ];

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  late final UserSettings? _defaultSettings;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _defaultSettings = objectBox.getUserSettings(1);
    if(_defaultSettings != null){
      setDefaults(_defaultSettings!);
    }
  }

  UserSettings settings = UserSettings(currentUnitOfMeasure: 1.0, lowestPlate: 5.0);
  final List<bool> _selectedUnitOfMeasure = <bool>[false, true];
  final List<bool> _selectedAvailablePlate = <bool>[false, true];

  void setUnitOfMeasure(index) {
    setState(() {
      for (int i = 0; i < _selectedUnitOfMeasure.length; i++) {
        _selectedUnitOfMeasure[i] = i == index;
      }
      if (_selectedUnitOfMeasure.first == true) {
        settings.currentUnitOfMeasure = 2.205;
      } else {
        settings.currentUnitOfMeasure = 1.0;
      }
      if(_defaultSettings != null){
        _defaultSettings?.currentUnitOfMeasure = settings.currentUnitOfMeasure;
        objectBox.insertNewSettings(_defaultSettings!);
      }
      else{
        objectBox.insertNewSettings(settings);
      }
    });
  }

  void setAvailiblePlate(index) {
    setState(() {
      for (int i = 0; i < _selectedAvailablePlate.length; i++) {
        _selectedAvailablePlate[i] = i == index;
      }
      if (_selectedAvailablePlate.first == true) {
        settings.lowestPlate = 2.5;
      } else {
        settings.lowestPlate = 5.0;
      }
      if(_defaultSettings != null) {
        _defaultSettings?.lowestPlate = settings.lowestPlate;
        objectBox.insertNewSettings(_defaultSettings!);
      }else{
        objectBox.insertNewSettings(settings);
      }
    });
  }

  void setDefaults(UserSettings defaultSettings) {
    if(_defaultSettings?.currentUnitOfMeasure == 1){
      _selectedUnitOfMeasure[1] = true;
      _selectedUnitOfMeasure[0] = false;
    } else{
      _selectedUnitOfMeasure[0] = true;
      _selectedUnitOfMeasure[1] = false;
    }
    if(_defaultSettings?.lowestPlate == 5.0){
      _selectedAvailablePlate[0] = false;
      _selectedAvailablePlate[1] = true;
    }else{
      _selectedAvailablePlate[1] = false;
      _selectedAvailablePlate[0] = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('User Settings'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Unit of Measure'),
                ToggleButtons(
                  onPressed: (int index) {
                    setUnitOfMeasure(index);
                  },
                  isSelected: _selectedUnitOfMeasure,
                  constraints: const BoxConstraints(
                    minWidth: 80,
                    minHeight: 40,
                  ),
                  children: UserSettingsScreen.unitsOfMeasure,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Lowest Availible Plate'),
                ToggleButtons(
                  onPressed: (int index) {
                    setAvailiblePlate(index);
                  },
                  isSelected: _selectedAvailablePlate,
                  constraints: const BoxConstraints(
                    minWidth: 80,
                    minHeight: 40,
                  ),
                  children: UserSettingsScreen.availablePlates,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
