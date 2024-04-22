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

class AnimatedOnAndOffSwitch extends StatefulWidget {
  const AnimatedOnAndOffSwitch({super.key});

  @override
  AnimatedOnAndOffSwitchState createState() => AnimatedOnAndOffSwitchState();
}

class AnimatedOnAndOffSwitchState extends State<AnimatedOnAndOffSwitch> {
  bool on = false;

  void _updateProgress() {
    setState(() {
      on = !on;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _updateProgress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 100, // Example scaling
        height: 40.0,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: on ? 60 : 0),
        decoration: BoxDecoration(
          color: on ? Colors.lightBlueAccent : Colors.grey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          //Without the Row, the child container will takeup the whole width and height of the parent
          mainAxisSize: MainAxisSize
              .min, //Using min size to ensure that the row uses the minmum size possible, that should be thte size of its child in this case
          children: [
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: on ? Colors.blue : Colors.black26,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                on ? "on" : "off",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
