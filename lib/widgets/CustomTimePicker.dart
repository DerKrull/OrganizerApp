import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/TimeController.dart';
import '../core/app_export.dart';

class CustomTimePicker extends StatelessWidget {
  CustomTimePicker({Key? key, required this.label, this.enabled = true}) : super(key: key);

  final String label;
  final bool enabled;
  final TimeController timeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(right: 20, left: 20),
      child: Container(
        decoration: BoxDecoration(
          color: CustomMaterialThemeColorConstant.dark.surface3,
          borderRadius: BorderRadius.circular(28.0),
        ),
        child: Padding(
          padding: getPadding(all: 20),
          child: TextFormField(
              controller: timeController.timeTextController,
              key: Key(timeController.timeTextController.text),
              expands: false,
              readOnly: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                label: Text(label),
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(color: Colors.white)),
              ),
              onTap: !enabled ? () {} : () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now() != timeController.actualTime
                      ? timeController.actualTime
                      : TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  timeController.updateSelectedTime(
                      newTime: pickedTime);
                } else {
                  if (kDebugMode) {
                    print("Time is not selected");
                  }
                }
              }),
        ),
      ),
    );
  }
}
