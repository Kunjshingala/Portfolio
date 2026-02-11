import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 2,
      color: const Color(0xFFF0F0F0),
      margin: const EdgeInsets.symmetric(vertical: 8),
    );
  }
}
