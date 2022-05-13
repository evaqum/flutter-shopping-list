import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../application/edit_list_screen/cubit.dart';
import '../../../domain/lists/list.dart';
import '../../../utils/helpers/extensions.dart';
import 'style_card.dart';

class StyleSelectSheet extends StatelessWidget {
  final EditListScreenCubit cubit;
  const StyleSelectSheet({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      minChildSize: 0.25,
      maxChildSize: 0.6,
      initialChildSize: 0.25,
      builder: (_, controller) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView(
          controller: controller,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 78.0,
            childAspectRatio: 1.0,
            mainAxisSpacing: 6.0,
            crossAxisSpacing: 6.0,
          ),
          children: [
            for (var style in ShoppingListStyle.values)
              StyleCard(
                style: style,
                onTap: () {
                  cubit.stylePicked(style);
                  context.navigator.pop();
                },
              ),
          ],
        ),
      ),
    );
  }
}
