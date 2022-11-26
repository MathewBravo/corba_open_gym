import 'package:corba_open_gym/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class PlanMakerScreen extends StatelessWidget {
  static const routeName = '/plan-maker';
  const PlanMakerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Plan Maker'),
      ),
      body: const Center(
        child: Text('Plan Maker'),
      ),
    );
  }
}
