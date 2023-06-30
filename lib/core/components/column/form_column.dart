import 'package:flutter/material.dart';

class FormColumn extends StatelessWidget {
  const FormColumn({super.key, this.children});

  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 8,
          child: Column(
            children: children!,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
