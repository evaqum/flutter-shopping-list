import 'package:flutter/material.dart';

import '../../../application/edit_list_screen/cubit.dart';
import '../../../utils/helpers/extensions.dart';
import '../../core/text_field.dart';

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
        child: QTextField(
          height: 64.0,
          focusNode: focusNode,
          backgroundColor: context.theme.colorScheme.surfaceVariant,
          initialValue: cubit.state.name,
          onChanged: cubit.nameChanged,
        ),
      ),
    );
  }
}
