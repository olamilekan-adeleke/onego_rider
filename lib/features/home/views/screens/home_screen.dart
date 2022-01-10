import 'package:flutter/material.dart';
import 'package:onego_rider/cores/components/custom_scaffold_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScaffoldWidget(
      body: Center(child: Text('home')),
    );
  }
}