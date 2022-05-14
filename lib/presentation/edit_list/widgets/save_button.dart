import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/edit_list_screen/cubit.dart';
import '../../../utils/helpers/extensions.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    EditListScreenCubit cubit = context.read();

    return FloatingActionButton(
      onPressed: () {
        cubit.listSaved();
        context.navigator.pop();
      },
      child: const Icon(Icons.save_outlined),
    );
  }
}
