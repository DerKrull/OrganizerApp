import 'package:get/get.dart';

import 'package:organizer_app/core/model/Event.dart';

class DropDownEventController extends GetxController {
  Event initialEvent = Event(title: '', description: '', dateTime: DateTime.now(), docRef: '');
  var event = Event(title: '', description: '', dateTime: DateTime.now(), docRef: '').obs;
  var eventError = "".obs;

  void changeEvent({required Event taskEvent}) {
    event.value = taskEvent;
  }

  void clear() {
    event.value = initialEvent;
  }

  void clearErrors() {
    eventError.value = "";
  }

  void displayError({String event = ""}) {
    if(event.isNotEmpty) eventError.value = event;
  }
}
