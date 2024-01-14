import 'package:flutter/material.dart';

class ShrewIconButton extends StatelessWidget {
  const ShrewIconButton({
    super.key,
    required this.icon,
    this.isActivate = true,
    this.onTap,
    this.color,
    this.splashColor,
    this.iconSize,
    this.splashRadius,
    this.eventName,
    this.eventParams,
    this.debounceTime,
  });

  static double defaultSize = 25.2;
  static double defaultSplashRadius = 20;
  static Color? defaultSplashColor;
  static Color defaultIconColor = Colors.black;

  final Widget icon;
  final bool isActivate;
  final GestureTapCallback? onTap;
  final Color? color;
  final Color? splashColor;
  final double? iconSize;
  final double? splashRadius;
  final String? eventName;
  final Map<String, dynamic>? eventParams;
  final int? debounceTime;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: IconButton(
        padding: const EdgeInsets.all(0),
        splashRadius: splashRadius ?? defaultSplashRadius,
        iconSize: iconSize ?? defaultSize,
        splashColor: splashColor ?? defaultSplashColor,
        highlightColor: Colors.transparent,
        color: color ?? defaultIconColor,
        onPressed: onTap,
        icon: icon,
      ),
    );
  }
}
