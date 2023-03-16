import 'package:get/get.dart';

import 'package:organizer_app/core/model/Event.dart';

class DropDownEventController extends GetxController {
  Event initialEvent = Event(title: '', description: '', dateTime: DateTime.now(), docRef: '');
  var event = Event(title: '', description: '', dateTime: DateTime.now(), docRef: '').obs;

  void changeEvent({required Event taskEvent}) {
    event.value = taskEvent;
  }

  void clear() {
    event.value = initialEvent;
  }
}
