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

class AnimatedProgressIndicator extends StatefulWidget {
  const AnimatedProgressIndicator({super.key});

  @override
  AnimatedProgressIndicatorState createState() =>
      AnimatedProgressIndicatorState();
}

class AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator> {
  double _currentProgress = 0.0;

  void _updateProgress() {
    setState(() {
      _currentProgress =
          (_currentProgress + 0.2).clamp(0.0, 1.0); // Keep within bounds
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _updateProgress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: 40.0 + (200 * _currentProgress), // Example scaling
        height: 40.0,
        padding: EdgeInsets.all(_currentProgress == 1.0 ? 10.0 : 5.0),
        decoration: BoxDecoration(
          color: Color.lerp(Colors.blue, Colors.green, _currentProgress),
          borderRadius:
              BorderRadius.circular(_currentProgress == 1.0 ? 0.0 : 15.0),
        ),
      ),
    );
  }
}
