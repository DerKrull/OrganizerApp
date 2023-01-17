import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app_export.dart';

class CustomNumberField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool multiline;

  const CustomNumberField({
    Key? key, required this.controller, required this.label, required this.hintText, this.multiline = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autofocus: false,
        keyboardType: TextInputType.number,
        minLines: 1,
        maxLines: 10,
        controller: controller,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        style: TextStyle(
          color: CustomMaterialThemeColorConstant.dark.onSurface,
        ),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: CustomMaterialThemeColorConstant.dark.onSurface),
            filled: true,
            fillColor: CustomMaterialThemeColorConstant.dark.surfaceVariant,
            label: Text(
                style: TextStyle(
                    color:
                    CustomMaterialThemeColorConstant.dark.onSurfaceVariant),
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
