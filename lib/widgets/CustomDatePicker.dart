import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer_app/controller/DateController.dart';

import '../core/app_export.dart';

class CustomDatePicker extends StatelessWidget {
  final bool enabled;

  CustomDatePicker({
    Key? key, required this.label, this.enabled = true
  }) : super(key: key);

  final String label;
  final DateController dateController = Get.find();

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
              controller: dateController.dateTextController,
              key: Key(dateController.dateTextController.text),
              expands: false,
              readOnly: true,
              enabled: enabled,
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
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(color: Colors.white))
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:DateTime(2000),
                    lastDate: DateTime(2101)
                );
                if(pickedDate != null ){
                  dateController.updateSelectedDate(newDate: pickedDate);
                }else{
                  if (kDebugMode) {
                    print("Date is not selected");
                  }
                }
              }),
        ),
      ),
    );
  }
}