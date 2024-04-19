import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 11 : 10,
      width: 11,
      decoration: isActive
          ? const BoxDecoration(
              color: Color(0xFF004AAD),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            )
          : const ShapeDecoration(
              color: Color(0xFFD9D9D9),
              shape: OvalBorder(
                side: BorderSide(width: 1, color: Colors.transparent),
              ),
            ),
    );
  }
}
