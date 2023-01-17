import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/SingleExpenditureController.dart';
import '../core/app_export.dart';

class CustomDatePicker extends StatelessWidget {
  CustomDatePicker({
    Key? key, required this.label
  }) : super(key: key);

  final String label;
  final SingleExpenditureController seController = Get.find();

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
              controller: seController.dateTextController,
              key: Key(seController.dateTextController.text),
              expands: false,
              readOnly: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                label:  Text(label),
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(color: Colors.white)),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:DateTime(2000),
                    lastDate: DateTime(2101)
                );
                if(pickedDate != null ){
                  seController.updateSelectedDate(newDate: pickedDate);
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