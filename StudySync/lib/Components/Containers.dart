import 'dart:ui';
import 'package:flutter/material.dart';

class Containers extends StatelessWidget {
  Containers({super.key, required this.child});
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 80,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: child),
      ),
    );
  }
}
