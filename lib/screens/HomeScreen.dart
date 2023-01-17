import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/widgets/CustomBottomAppBar.dart';
import 'package:organizer_app/widgets/CustomTopAppBarHome.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
      appBar: const CustomTopAppBarHome(),
      body: const Text(
        "Ich bin der Body",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      //bottomNavigationBar: buildBottomNavigationBar(),
      bottomNavigationBar: CustomBottomAppBar(
        mainPage: MainPages.HomeScreen,
        currentPage: CurrentPages.HomeScreen,
      ),
    );
  }
}
