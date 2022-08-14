import 'package:flutter/material.dart';

class PrimaryListTile extends StatelessWidget {
  const PrimaryListTile({
    Key? key,
    required this.childWidget,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);
  final Widget childWidget;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      onLongPress: onLongPress ?? () {},
      child: Card(
        child: SizedBox(
          height: 130,
          child: childWidget,
        ),
      ),
    );
  }
}
