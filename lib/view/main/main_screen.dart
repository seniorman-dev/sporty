import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sporty/controllers/controllers/main/mainscreen_controller.dart';
import 'package:sporty/view/main/bottom_navbar.dart';









class MainPage extends StatefulWidget {
  const MainPage({super.key,});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final MainPageController controller = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return Center(
            child: controller.widgetOptions.elementAt(controller.selectedIndex.value), //widget.index
          );
        }
      ),
      bottomNavigationBar: Obx(
        () {
          return BottomNavBar(
            selectedIndex: controller.selectedIndex.value,
            onItemTapped: controller.setIndex,
            items: controller.navBarsItems(),
          );
        }
      )
    );
  }
}
