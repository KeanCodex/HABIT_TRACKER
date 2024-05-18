import 'package:flutter/material.dart';

class NeoBox extends StatelessWidget {
  const NeoBox({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            //Dark shadow config
            BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 5,
                offset: const Offset(3, 3)),

            //White shadow config
            const BoxShadow(
              color: Colors.white38,
              blurRadius: 7,
              offset: Offset(-3, -3),
            ),
          ]),
      child: child,
    );
  }
}
