import 'package:flutter/material.dart';

import '../../domain/lists/list.dart';
import '../../utils/helpers/extensions.dart';
import '../core/app_bar.dart';

class ShoppingListScreen extends StatelessWidget {
  final ShoppingList shoppingList;
  const ShoppingListScreen({
    super.key,
    required this.shoppingList,
  });

  static Route<void> route(ShoppingList shoppingList) {
    return MaterialPageRoute(
      builder: (_) => ShoppingListScreen(shoppingList: shoppingList),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QAppBar(
        backgroundColor: shoppingList.style.color,
        title: Text(shoppingList.name),
        leading: IconButton(
          onPressed: () => context.navigator.maybePop(),
          icon: Stack(children: [
            const Center(child: BackButtonIcon()),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(shoppingList.style.emoji),
            ),
          ]),
        ),
      ),
      body: Center(
        child: Image.asset('assets/pic.jpg'),
      ),
    );
  }
}
