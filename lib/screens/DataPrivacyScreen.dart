import 'package:flutter/material.dart';
import 'package:organizer_app/screens/HomeScreen.dart';

class DataPrivacyScreen extends StatelessWidget {
  const DataPrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 42, 77, 143),
        title: const Text(
          "Datenschutzeinstellungen",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 24.0, 30.0, 0),
              child: Container(
                child: const Text(
                  "Wir benötigen Ihre Zustimmung",
                  style: TextStyle(
                    color: Color.fromARGB(255, 42, 77, 143),
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
            buildWhiteSpace(height: 15.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 30.0, 0.0),
              child: Container(
                  child: buildText(
                      text: "Wir verwenden verschiedene "
                          "Technologien für die korrekte "
                          "Funktionsweise sowie um die Zugriffe auf unsere App zu "
                          "analysieren, Inhalte und Anzeigen zu personalisieren sowie"
                          " Funktionen für soziale Medien anbieten zu können.",
                      size: 18.0)),
            ),
            buildWhiteSpace(height: 20.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 30.0, 0.0),
              child: Container(
                child: buildText(
                    text: "Mit dem Klick auf \"Einverstanden\" "
                        "willigen Sie in die Erhebung und Verarbeitung Ihrer "
                        "nutzer- oder gerätebezogene "
                        "Online-Kennungen (z.B. IDs) und Nutzungsdaten für diese "
                        "Zwecke ein, sofern es einer Einwilligung bedarf. Sie können "
                        "die aktuellen Einstellungen unter \"Details anzeigen\" "
                        "einsehen und ändern. Weitere Informationen finden Sie in "
                        "unserer Datenschutzinformation.",
                    size: 18.0),
              ),
            ),
            buildWhiteSpace(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(380, 55),
                  maximumSize: const Size(380, 55),
                  backgroundColor: const Color.fromARGB(255, 198, 215, 245),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  )),
              onPressed: () => print("Details Anzeigen"),
              child: const Text(
                "DETAILS ANZEIGEN",
                style: TextStyle(
                  color: Color.fromARGB(255, 42, 77, 143),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            buildWhiteSpace(height: 10.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(380, 55),
                  maximumSize: const Size(380, 55),
                  backgroundColor: const Color.fromARGB(255, 28, 52, 97),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  )),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              child: const Text(
                "OK",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
            ),
            buildWhiteSpace(height: 20.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 30.0, 0.0),
              child: Container(
                width: width,
                child: GestureDetector(
                  onTap: () => print("Datenschutzinformation"),
                  child: const Text(
                    "Datenschutzinformation",
                    style: TextStyle(
                      color: Color.fromARGB(255, 22, 22, 255),
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildText({text: String, size: double}) {
    return Text(
      text,
      style: TextStyle(
        color: Color.fromARGB(255, 42, 77, 143),
        fontSize: size,
      ),
    );
  }

  Widget buildWhiteSpace({height: double}) {
    return SizedBox(
      height: height,
    );
  }
}