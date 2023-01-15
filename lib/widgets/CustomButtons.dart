import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key, required this.onPressed}) : super(key: key);
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
            CustomMaterialThemeColorConstant.dark.onPrimary),
        padding: MaterialStatePropertyAll(
            getPadding(left: 30, right: 30, top: 20, bottom: 20)),
      ),
      child: Text(style: TextStyle(
          color: CustomMaterialThemeColorConstant.dark.onPrimaryContainer,
          fontSize: 15), "Speichern"));
  }
}

class AbortButton extends StatelessWidget {
  const AbortButton({Key? key, required this.onPressed}) : super(key: key);
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
            CustomMaterialThemeColorConstant.dark.surfaceTint),
        padding: MaterialStatePropertyAll(
            getPadding(left: 30, right: 30, top: 20, bottom: 20)),
      ),
      child: Text(style: TextStyle(
          color: CustomMaterialThemeColorConstant.dark.onPrimary,
          fontSize: 15), "Abbrechen"),);

  }
}

