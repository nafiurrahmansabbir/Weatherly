import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  const Skelton({
    super.key, required this.height,  required this.width, required this.opacity, this.child,
  });
  final double height,width,opacity;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(opacity!),
        borderRadius: BorderRadius.circular(40),
      ),
      child: child,
    );
  }
}
