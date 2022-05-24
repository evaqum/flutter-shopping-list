import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiver/time.dart';

class DismissableListTile extends StatefulWidget {
  final void Function(DismissDirection)? onDismissed;
  final void Function()? onTap;
  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;

  const DismissableListTile({
    this.onDismissed,
    required super.key,
    this.onTap,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
  });

  @override
  State<DismissableListTile> createState() => _DismissableListTileState();
}

class _DismissableListTileState extends State<DismissableListTile> with SingleTickerProviderStateMixin {
  late final AnimationController _dismissAnimationController;
  late final Animation<double> _clipAnimation;

  @override
  void initState() {
    super.initState();
    _dismissAnimationController = AnimationController(
      vsync: this,
      duration: aMillisecond * 700,
    );

    _clipAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _dismissAnimationController,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onUpdate: (details) {
        if (details.previousReached == details.reached) {
          return;
        }
        if (details.reached) {
          _dismissAnimationController.forward();
        } else {
          _dismissAnimationController.animateBack(
            0.0,
            duration: aMillisecond * 400,
          );
        }
      },
      onDismissed: widget.onDismissed,
      key: widget.key!,
      background: Container(
        decoration: const BoxDecoration(color: Colors.red),
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _dismissAnimationController,
              builder: (context, _) {
                return ClipPath(
                  clipper: _CircularClipper(
                    alignment: Alignment.centerRight,
                    rightPadding: 44.0,
                    animation: 1.0 - _clipAnimation.value,
                  ),
                  child: Container(
                    color: Colors.grey.shade800,
                  ),
                );
              },
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 32.0),
                child: Icon(Icons.delete_outline, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 4.0,
        ),
        onTap: widget.onTap,
        title: widget.title,
        subtitle: widget.subtitle,
        leading: widget.leading,
        trailing: widget.trailing,
      ),
    );
  }

  @override
  void dispose() {
    _dismissAnimationController.dispose();
    super.dispose();
  }
}

class _CircularClipper extends CustomClipper<Path> {
  final Alignment alignment;
  final double? rightPadding;
  final double animation;

  _CircularClipper({
    required this.alignment,
    required this.animation,
    this.rightPadding,
  });

  @override
  Path getClip(Size size) {
    Offset center = alignment.alongSize(size) + Offset(-(rightPadding ?? 0.0), 0.0);

    return Path()
      ..addOval(Rect.fromCircle(
        center: center,
        radius: lerpDouble(0.0, calcMaxRadius(size, center), animation)!,
      ));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  static double calcMaxRadius(Size size, Offset center) {
    final w = max(center.dx, size.width - center.dx);
    final h = max(center.dy, size.height - center.dy);
    return sqrt(w * w + h * h);
  }
}
