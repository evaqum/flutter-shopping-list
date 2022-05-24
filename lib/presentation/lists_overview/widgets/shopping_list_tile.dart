import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../application/lists_overview_screen/cubit.dart';
import '../../../domain/lists/list.dart';
import '../../../routing/router.dart';
import '../../../utils/helpers/extensions.dart';
import '../../core/dissmissable_list_tile.dart';

class ShoppingListTile extends StatelessWidget {
  final ShoppingList shoppingList;

  const ShoppingListTile({
    required this.shoppingList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int productsAmount = shoppingList.products.length;
    int undoneProductsAmount = shoppingList.products.where((p) => !p.isDone).length;

    return DismissableListTile(
      key: Key('ShoppingListTile_${shoppingList.id}'),
      onDismissed: (_) {
        context.read<ListsOverviewScreenCubit>().listRemoved(shoppingList);
      },
      onTap: () => context.navigator.pushNamed(
        QRouter.shoppingListRoute,
        arguments: shoppingList,
      ),
      title: Text(shoppingList.name),
      subtitle: Text(
        productsAmount == 0
            ? 'empty list'
            : '$productsAmount '
                '${Intl.plural(
                productsAmount,
                one: 'product',
                two: 'products',
                other: 'products',
              )}',
      ),
      leading: SizedBox(
        height: 52.0,
        width: 52.0,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: shoppingList.style.color,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Text(
                  shoppingList.style.emoji,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            if (undoneProductsAmount != 0)
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 18.0,
                  width: 18.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Center(
                    child: Text(
                      undoneProductsAmount < 10 ? '$undoneProductsAmount' : '9+',
                      style: TextStyle(
                        fontSize: undoneProductsAmount < 10 ? 12.0 : 10.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      trailing: const Icon(Icons.chevron_right_rounded),
    );
  }
}
