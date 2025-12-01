import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimationLine extends StatefulWidget {
  const AnimationLine({super.key});

  @override
  State<AnimationLine> createState() => _AnimationLineState();
}

class _AnimationLineState extends State<AnimationLine>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                children: [
                  SvgPicture.asset(
                    'assets/images/logo/Rectangle 9.svg',
                    color: Colors.white70,
                  ),

                  ClipRect(
                    child: Align(
                      widthFactor: _controller.value,
                      child: SvgPicture.asset(
                        'assets/images/logo/Rectangle 9.svg',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
