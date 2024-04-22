import 'package:flutter/material.dart';

class ContainerExample1 extends StatelessWidget {
  const ContainerExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Text(
        'Hello!',
        textAlign: TextAlign.center,
      ),
    );
  }
}
