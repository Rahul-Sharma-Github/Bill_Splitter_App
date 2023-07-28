// GetX
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Slider Value [ Number of friends ]
  var currentSliderValue = 1.obs;

  // tax Amount
  var taxAmount = 0.obs;
  // method to increase taxAmount value
  void tipIncrease() {
    taxAmount.value++;
  }

  // method to Decrease taxAmount value
  void taxDecrease() {
    if (taxAmount.value == 0) {
    } else {
      taxAmount.value--;
    }
  }

  // TextEditingController for tipAmount
  TextEditingController tipAmountController = TextEditingController();

  // Tip Amount
  var tipAmount = '0'.obs;

  // TextEditingController for TotalAmount
  TextEditingController totalAmountController = TextEditingController();

  // Tip Amount
  var totalAmount = '0'.obs;

  // Calculations for getting equally divided amount for each friend

  String equallyDividedValue() {
    try {
      var preEquallyDivided =
          (double.parse(totalAmount.value) / 100 * taxAmount.value) +
              double.parse(totalAmount.value) +
              double.parse(tipAmount.value);

      var equallyDivided = preEquallyDivided / currentSliderValue.value;

      return equallyDivided.toPrecision(2).toString();
    } catch (e) {
      return e.toString();
    }
  }
}
