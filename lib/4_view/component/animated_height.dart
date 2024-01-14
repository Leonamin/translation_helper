import 'package:flutter/material.dart';

class AnimatedHeight extends StatefulWidget {
  const AnimatedHeight({
    required this.child,
    required this.visible,
    this.replacement,
    this.animDuration,
    super.key,
  });

  final bool visible;
  final Widget child;
  final Widget? replacement; // show this widget when visible is false
  final int? animDuration;

  @override
  AnimatedHeightState createState() => AnimatedHeightState();
}

class AnimatedHeightState extends State<AnimatedHeight>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Animation? _replacementAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(
        milliseconds: widget.animDuration ?? 300,
      ),
      vsync: this,
      value: widget.visible ? 1 : 0,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    if (widget.replacement is Widget) {
      _replacementAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        ),
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.visible
        ? _animationController.forward()
        : _animationController.reverse();

    return Column(
      children: [
        // build replacement
        if (widget.replacement is Widget)
          AnimatedBuilder(
            animation: _replacementAnimation!,
            builder: (_, child) {
              final value = _replacementAnimation!.value;
              return Opacity(
                opacity: value,
                child: Align(
                  heightFactor: value,
                  child: widget.replacement,
                ),
              );
            },
          ),
        // build childeren
        AnimatedBuilder(
          animation: _animationController,
          builder: (_, child) {
            final value = _animation.value;
            return Opacity(
              opacity: value,
              child: Align(
                heightFactor: value,
                child: widget.child,
              ),
            );
          },
        ),
      ],
    );
  }
}
