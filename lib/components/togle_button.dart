import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class TogleBtn extends StatefulWidget {
  final String firstValue;
  final String secondValue;
  const TogleBtn(
      {super.key, required this.firstValue, required this.secondValue});

  @override
  State<TogleBtn> createState() => _TogleBtnState();
}

class _TogleBtnState extends State<TogleBtn> {
  bool firstSwitchValue = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.size(
      current: firstSwitchValue,
      values: const [false, true],
      iconOpacity: 0.2,
      indicatorSize: Size.fromWidth(100),
      customIconBuilder: (context, local, global) => Text(
        local.value ? widget.firstValue : widget.secondValue,
        style: TextStyle(
          fontSize: 18,
          color: Color.lerp(const Color.fromARGB(255, 255, 255, 255),
              Colors.white, local.animationValue),
        ),
      ),
      borderWidth: 1.0,
      iconAnimationType: AnimationType.onHover,
      style: ToggleStyle(
        indicatorGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff0F55E8),
            Color(0xff04050F00),
            Color(0xff0F55E8),
          ],
        ),
        backgroundColor: Color(0xff1D102D),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple,
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
        borderColor: Colors.deepPurple,
        borderRadius: BorderRadius.circular(10),
      ),
      selectedIconScale: 1.0,
      onChanged: (value) => setState(() => firstSwitchValue = value),
    );
  }
}
