import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BotaoCircular extends StatefulWidget {
  late IconData? icon;
  late void Function()? onPressed;

  BotaoCircular({
    Key? key,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  _BotaoCircularState createState() => _BotaoCircularState();
}

class _BotaoCircularState extends State<BotaoCircular> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const ShapeDecoration(
        color: Colors.deepPurple,
        shape: CircleBorder(),
      ),
      child: IconButton(
        icon: Icon(widget.icon),
        color: Colors.white,
        onPressed: widget.onPressed,
      ),
    );
  }
}
