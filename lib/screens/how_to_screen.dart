import 'package:corba_open_gym/widgets/main_app_bar.dart';
import 'package:corba_open_gym/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class HowToScreen extends StatelessWidget {
  static const routeName = '/how-to';

  const HowToScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How To'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
         Text('How To')
        ],
      ),
    );
  }
}
