import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton(
      {Key? key,
      required this.iconData,
      required this.voidCallback,
      required this.backgroundColor})
      : super(key: key);
  final IconData iconData;
  final VoidCallback voidCallback;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(10),
          primary: backgroundColor),
      child: Icon(
        iconData,
        size: 20,
      ),
    );
  }
}
