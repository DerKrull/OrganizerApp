import 'package:flutter/material.dart';

import '../core/app_export.dart';

class CustomReadOnlyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool multiline;

  const CustomReadOnlyTextField(
      {Key? key,
        required this.controller,
        required this.label,
        this.multiline = false,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        enabled: false,
        readOnly: true,
        autofocus: false,
        keyboardType:
        multiline ? TextInputType.multiline : TextInputType.name,
        minLines: 1,
        maxLines: 10,
        controller: controller,
        style: TextStyle(
          color: CustomMaterialThemeColorConstant.dark.onSurface,
        ),
        decoration: InputDecoration(
            hintStyle: TextStyle(
                color: CustomMaterialThemeColorConstant.dark.onSurface),
            filled: true,
            fillColor:
            CustomMaterialThemeColorConstant.dark.surfaceVariant,
            label: Text(
                style: TextStyle(
                    color: CustomMaterialThemeColorConstant
                        .dark.onSurfaceVariant),
                label),
            ),
      ),
    );

  }
}
