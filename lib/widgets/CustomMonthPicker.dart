import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';
import 'package:organizer_app/core/app_export.dart';

import '../controller/MonthController.dart';

class CustomMonthPicker extends StatelessWidget {
  CustomMonthPicker({Key? key}) : super(key: key);

  DateFormat format = DateFormat();

  final MonthController monthController = Get.find();

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('de_DE');
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
              controller: monthController.monthTextController,
              key: Key(DateFormat("MMMM", "de_DE").format(monthController.actualMonth.value)),
              expands: false,
              readOnly: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                label: const Text("Monat"),
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(color: Colors.white)),
              ),
              onTap: () => {
                    showMonthPicker(
                      locale: const Locale("de_DE"),
                      cancelText: const Text("Abbrechen"),
                      context: context,
                      customHeight: 250,
                      firstDate: DateTime(DateTime.now().year - 1, 5),
                      lastDate: DateTime(DateTime.now().year + 1, 9),
                      initialDate: monthController.actualMonth.value,
                      headerColor: CustomMaterialThemeColorConstant
                          .dark.primaryContainer,
                      headerTextColor: CustomMaterialThemeColorConstant
                          .dark.onPrimaryContainer,
                      selectedMonthBackgroundColor:
                          CustomMaterialThemeColorConstant
                              .dark.primaryContainer,
                      selectedMonthTextColor: CustomMaterialThemeColorConstant
                          .dark.onPrimaryContainer,
                      unselectedMonthTextColor:
                          CustomMaterialThemeColorConstant.dark.onSecondary,
                    ).then((date) {
                      if (date != null) {
                        monthController.updateSelectedMonth(newMonth: date);
                        if (kDebugMode) {
                          print(
                              "Selected Date is: ${DateFormat("dd.MM.yyyy hh:mm", 'de_DE').format(monthController.actualMonth.value)}");
                        }
                      }
                    })
                  }),
        ),
      ),
    );
  }
}
