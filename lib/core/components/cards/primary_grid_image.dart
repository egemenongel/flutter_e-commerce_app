import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class PrimaryGridImage extends StatelessWidget {
  const PrimaryGridImage({
    Key? key,
    this.height,
    this.imagePath,
    required this.childWidget,
  }) : super(key: key);

  final double? height;
  final String? imagePath;
  final Widget childWidget;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? context.height / 2,
        child: Stack(
          fit: StackFit.expand,
          children: [
            imagePath != null
                ? Image.asset(
                    fit: BoxFit.fill,
                    imagePath!,
                  )
                : const SizedBox(),
            childWidget,
          ],
        ));
  }
}
