import 'package:flutter/material.dart';

class MobileConstraint extends StatelessWidget
{
  final Widget child;

  const MobileConstraint({super.key, required this.child});

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    const double maxWidth = 500;

    if (screenWidth <= maxWidth) {
      // Mobile device - no constraint
      return child;
    }
    
    // Tablet/Desktop - override MediaQuery to report mobile dimensions
    return Container(
      color: Colors.black,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: screenHeight,
            maxWidth: maxWidth,
          ),
          child: child,
        ),
      ),
    );
  }
}
