import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

//Fungsi untuk menambah
  void incrementCounter() {
    counter++;
  }

  //Fungsi untuk mengurangi
  void decrementCounter() {
    counter--;
  }

  void getSnackBar() {
    Get.snackbar(
      'GetX Snackbr',
      'Ini adalah getX',
      backgroundColor: Colors.amber,
      colorText: Colors.black,
    );
  }

  void getbottomshet() {
    Get.bottomSheet(
      Container(
        height: 200,
        color: Colors.green,
        child: const Center(
          child: Text(
            'Ini adalah getX BottomSheet',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
