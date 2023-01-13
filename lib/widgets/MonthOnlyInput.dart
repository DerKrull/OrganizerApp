import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';
import 'package:organizer_app/core/app_export.dart';

class MonthOnlyInput extends StatefulWidget {
  final DateTime initialDate;
  MonthOnlyInput({Key? key, required this.initialDate}) : super(key: key);

  @override
  State<MonthOnlyInput> createState() => _MonthOnlyInputState();
}

class _MonthOnlyInputState extends State<MonthOnlyInput> {
  Future<void> dataReceived = initializeDateFormatting('de', null);

  DateTime? selectedDate;
  DateFormat format = DateFormat('MMMM', 'de');

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

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
              key: Key(format.format(selectedDate!)),
              initialValue: format.format(selectedDate!),
              expands: false,
              readOnly: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                label: const Text("Monat"),
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(color: Colors.white)),
              ),
              onTap: () => {
                showMonthPicker(
                  context: context,
                  firstDate: DateTime(DateTime.now().year - 1, 5),
                  lastDate: DateTime(DateTime.now().year + 1, 9),
                  initialDate: selectedDate ?? widget.initialDate,
                  headerColor: CustomMaterialThemeColorConstant.dark.primaryContainer,
                  headerTextColor: CustomMaterialThemeColorConstant.dark.onPrimaryContainer,
                  selectedMonthBackgroundColor: CustomMaterialThemeColorConstant.dark.primaryContainer,
                  selectedMonthTextColor: CustomMaterialThemeColorConstant.dark.onPrimaryContainer,
                  unselectedMonthTextColor: CustomMaterialThemeColorConstant.dark.onSecondary,
                ).then((date) {
                  if (date != null) {
                    setState(() {
                      selectedDate = date;
                    });
                  }
                })
              }),
        ),
      ),
    );
  }
}
