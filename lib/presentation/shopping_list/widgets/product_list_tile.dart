import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/shopping_list_screen/cubit.dart';
import '../../../domain/products/product.dart';
import '../../core/dissmissable_list_tile.dart';

class ProductListTile extends StatelessWidget {
  final Product product;
  const ProductListTile({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ShoppingListScreenCubit cubit = context.watch();

    return DismissableListTile(
      key: Key('ProductListTile_${product.id}'),
      title: Text(
        product.title,
        style: TextStyle(
          decoration: product.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: product.isDone,
        onChanged: (v) {
          cubit.productChecked(product, isDone: v);
        },
      ),
      onTap: () {
        cubit.productChecked(product, isDone: !product.isDone);
      },
      onDismissed: (_) {
        cubit.productRemoved(product);
      },
    );
  }
}
