import 'package:flutter/material.dart';

import '../../../application/edit_list_screen/cubit.dart';
import '../../../utils/helpers/extensions.dart';

class SaveButton extends StatelessWidget {
  final EditListScreenCubit cubit;
  const SaveButton({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    if (cubit.state.name.isEmpty) {
      return const SizedBox.shrink();
    }
    return FloatingActionButton(
      onPressed: () {
        cubit.savePressed();
        context.navigator.pop();
      },
      child: const Icon(Icons.save_outlined),
    );
  }
}
