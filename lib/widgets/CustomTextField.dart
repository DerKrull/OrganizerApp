import 'package:flutter/material.dart';

import '../core/app_export.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool multiline;
  final String? errorMessage;
  final bool enabled;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.hintText,
      this.multiline = false,
      this.errorMessage,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              autofocus: false,
              keyboardType:
                  multiline ? TextInputType.multiline : TextInputType.name,
              minLines: 1,
              maxLines: 10,
              controller: controller,
              enabled: enabled,
              style: TextStyle(
                color: CustomMaterialThemeColorConstant.dark.onSurface,
              ),
              decoration: InputDecoration(
                  errorText: errorMessage,
                  hintText: hintText,
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
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.cancel_outlined),
                    color: CustomMaterialThemeColorConstant.dark.onSurface,
                    onPressed: () {
                      controller.clear();
                    },
                  )),
            ),
            );

  }
}
