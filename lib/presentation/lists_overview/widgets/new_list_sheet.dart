import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiver/time.dart';

import '../../../application/new_list_sheet/cubit.dart';
import '../../../domain/lists/list.dart';
import '../../../utils/helpers/extensions.dart';

class NewListSheet extends StatelessWidget {
  final FocusNode? nameFocusNode;

  const NewListSheet({super.key, this.nameFocusNode});

  @override
  Widget build(BuildContext context) {
    NewListSheetCubit cubit = context.watch();
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    if (cubit.state.showStyleSelector) {
      nameFocusNode?.unfocus();
    } else {
      nameFocusNode?.requestFocus();
    }

    return Theme(
      data: context.theme.copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: cubit.state.listStyle.color,
        ),
      ),
      child: Builder(builder: (context) {
        return Wrap(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(16.0),
                        right: Radius.zero,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.0,
                          offset: Offset(0.0, 4.0),
                        ),
                      ],
                    ),
                    height: 52.0,
                    // child: _NameField(nameFocusNode: nameFocusNode),
                    child: AnimatedSwitcher(
                      duration: aMillisecond * 400,
                      switchInCurve: Curves.easeInOutCubic,
                      child: cubit.state.showStyleSelector ? const _StyleSelector() : _NameField(nameFocusNode: nameFocusNode),
                    ),
                  ),
                ),
                Ink(
                  height: 52.0,
                  width: 52.0,
                  decoration: BoxDecoration(
                    color: cubit.state.listStyle.color,
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(16.0),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4.0,
                        offset: Offset(0.0, 4.0),
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      cubit.toggleStyleSelector(!cubit.state.showStyleSelector);
                    },
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(16.0),
                    ),
                    child: Center(
                      child: Text(
                        cubit.state.listStyle.emoji,
                        style: const TextStyle(fontSize: 24.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Ink(
            height: 52.0,
            width: double.infinity,
            decoration: BoxDecoration(
              // borderRadius: const BorderRadius.vertical(
              //   top: Radius.circular(8.0),
              // ),
              color: cubit.state.name.isNotEmpty ? context.theme.colorScheme.primary : context.theme.colorScheme.primary.withOpacity(0.2),
            ),
            child: InkWell(
              onTap: cubit.state.name.isNotEmpty
                  ? () {
                      cubit.listSaved();
                      context.navigator.pop();
                    }
                  : null,
              child: Center(
                child: Text(
                  'Create',
                  style: TextStyle(
                    color: context.theme.colorScheme.onPrimary,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: aMillisecond * 30,
            // curve: Curves.easeInOutCubic,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.theme.colorScheme.primary.withOpacity(0.0),
                  context.theme.colorScheme.primary.withOpacity(0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            width: double.infinity,
            height: keyboardHeight,
          ),
        ]);
      }),
    );
  }
}

class _StyleSelector extends StatelessWidget {
  const _StyleSelector();

  @override
  Widget build(BuildContext context) {
    NewListSheetCubit cubit = context.read();

    return ListView.builder(
      shrinkWrap: true,
      itemExtent: 64.0,
      scrollDirection: Axis.horizontal,
      itemCount: ShoppingListStyle.values.length,
      itemBuilder: (context, index) {
        final style = ShoppingListStyle.values[index];
        return GestureDetector(
          onTap: () => cubit.styleSelected(style),
          child: Container(
            height: 52.0,
            width: 64.0,
            color: style.color,
            child: Center(
              child: Text(
                style.emoji,
                style: const TextStyle(fontSize: 22.0),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NameField extends StatelessWidget {
  final FocusNode? nameFocusNode;

  const _NameField({this.nameFocusNode});

  @override
  Widget build(BuildContext context) {
    NewListSheetCubit cubit = context.read();

    return TextFormField(
      enabled: !cubit.state.showStyleSelector,
      focusNode: nameFocusNode,
      initialValue: cubit.state.name,
      onChanged: cubit.nameChanged,
      onFieldSubmitted: (_) {
        cubit.listSaved();
        context.navigator.pop();
      },
      decoration: const InputDecoration(
        label: Text('List name'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(16.0),
            right: Radius.zero,
          ),
        ),
      ),
      style: const TextStyle(
        fontSize: 16.0,
      ),
    );
  }
}
