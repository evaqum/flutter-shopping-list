import 'package:flutter/material.dart';

import '../../../application/edit_list_screen/cubit.dart';

class ListNameField extends StatelessWidget {
  final FocusNode focusNode;
  final EditListScreenCubit cubit;
  const ListNameField({
    super.key,
    required this.focusNode,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          initialValue: cubit.state.name,
          onChanged: cubit.nameChanged,
          decoration: InputDecoration(
            hintText: 'Shopping list name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
      ),
    );
  }
}
