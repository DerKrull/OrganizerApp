import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class FireStoreTestScreen extends StatelessWidget {
  final String documentId = "8cEDuuKTrO7g7Nv2pfsj";

  @override
  Widget build(BuildContext context) {
    CollectionReference expenditure = FirebaseFirestore.instance.collection('expenditure');
    return FutureBuilder(future: expenditure.doc(documentId).get(),
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return Text("Something went wrong");
          }

          if(snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if(snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return Text("You bought something for ${data['value']} \$");
          }

          return Text("loading");
        });
  }
}
