import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiver/time.dart';

import '../../../application/lists/cubit.dart';
import '../../../domain/lists/list.dart';
import '../../../routing/router.dart';
import '../../../utils/helpers/extensions.dart';

class ShoppingListTile extends StatefulWidget {
  final ShoppingList shoppingList;

  const ShoppingListTile({
    super.key,
    required this.shoppingList,
  });

  @override
  State<ShoppingListTile> createState() => _ShoppingListTileState();
}

class _ShoppingListTileState extends State<ShoppingListTile>
    with SingleTickerProviderStateMixin {
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
          _dismissAnimationController.reverse();
        }
      },
      onDismissed: (_) {
        context.read<ListsCubit>().listRemoved(widget.shoppingList);
      },
      key: Key('ListListTile_${widget.shoppingList.key}'),
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
          vertical: 12.0,
        ),
        onTap: () => context.navigator.pushNamed(
          QRouter.editListRoute,
          arguments: widget.shoppingList,
        ),
        title: Text(widget.shoppingList.name),
        leading: Container(
          height: 52.0,
          width: 52.0,
          decoration: BoxDecoration(
            color: widget.shoppingList.style.color,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Center(
            child: Text(
              widget.shoppingList.style.emoji,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ),
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
    Offset center =
        alignment.alongSize(size) + Offset(-(rightPadding ?? 0.0), 0.0);

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
