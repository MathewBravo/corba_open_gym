import 'package:corba_open_gym/widgets/main_app_bar.dart';
import 'package:corba_open_gym/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: MainDrawer(),
      appBar: MainAppBar(),
    );
  }
}
