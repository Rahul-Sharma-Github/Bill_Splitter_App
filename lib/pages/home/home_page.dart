// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

//GetX
import 'package:get/get.dart';

import '../../models/result_data.dart';
import '../result/result_page.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // initializing HomeController
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                // child = 1 [ Title Widget]
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Split Bill',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    )
                  ],
                ),
                // child = 2 [ information Card Widget]
                Card(
                  color: Colors.amber.shade700.withOpacity(0.8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Total',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    '${homeController.totalAmount.value} ₹',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Friends',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    'Tax',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    'Tip',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(
                                    () => Text(
                                      homeController.currentSliderValue.value
                                          .round()
                                          .toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      '${homeController.taxAmount.value.toString()} %',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      '${homeController.tipAmount.value.toString()} ₹',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
                // child = 3 [ Friend Count Slider Widget]
                const Divider(thickness: 2, height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'How many friends ?',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      )
                    ],
                  ),
                ),
                Obx(
                  () => Slider(
                    label: homeController.currentSliderValue.value
                        .round()
                        .toString(),
                    min: 1,
                    max: 50,
                    divisions: 50,
                    value: homeController.currentSliderValue.value.toDouble(),
                    onChanged: (value) {
                      homeController.currentSliderValue.value = value.toInt();
                    },
                  ),
                ),
                const Divider(thickness: 2, height: 20),
                // child = 4 [ Tip and Tax Widget]
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Tax ( % )',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () => homeController.taxDecrease(),
                                      child: const CircleAvatar(
                                        child: Icon(
                                            Icons.horizontal_rule_outlined,
                                            size: 32),
                                      ),
                                    ),
                                    Obx(
                                      () => Text(
                                        '${homeController.taxAmount.value} %',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => homeController.tipIncrease(),
                                      child: const CircleAvatar(
                                        child: Icon(Icons.add, size: 32),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  label: const Text('Enter Tip Amount'),
                                ),
                                controller: homeController.tipAmountController,
                                onChanged: (value) {
                                  homeController.tipAmount.value =
                                      homeController.tipAmountController.text;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 2, height: 20),
                // child = 5 [ Total amount textfield Widget]
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        'Enter Total Amount',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      label: const Text(
                        'Enter Total Amount',
                      ),
                    ),
                    controller: homeController.totalAmountController,
                    onChanged: (value) {
                      homeController.totalAmount.value =
                          homeController.totalAmountController.text;
                    },
                  ),
                ),
                const Divider(thickness: 2, height: 20),
                const SizedBox(
                  height: 25,
                ),
                // child = 6 [ Split Bill Button Widget]
                ElevatedButton(
                  onPressed: () {
                    // Testing and Checking the values first
                    if (homeController.totalAmount.value == '0' ||
                        homeController.totalAmount.value.length.isEqual(0)) {
                      Get.snackbar('Warning', 'Enter Total Amount');
                    } else {
                      if (homeController.tipAmount.value.length.isEqual(0)) {
                        homeController.tipAmount.value = '0';

                        // Initializing the ResultData Model class with values and Passing the values
                        // so that on ResultPage we can use these values
                        Get.to(() => ResultPage(
                              resultData: ResultData(
                                homeController.equallyDividedValue(),
                                homeController.currentSliderValue.value
                                    .round()
                                    .toString(),
                                homeController.taxAmount.value.toString(),
                                homeController.tipAmount.value.toString(),
                              ),
                            ));
                      } else {
                        // Initializing the ResultData Model class with values and Passing the values
                        // so that on ResultPage we can use these values
                        Get.to(() => ResultPage(
                              resultData: ResultData(
                                homeController.equallyDividedValue(),
                                homeController.currentSliderValue.value
                                    .round()
                                    .toString(),
                                homeController.taxAmount.value.toString(),
                                homeController.tipAmount.value.toString(),
                              ),
                            ));
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.yellowAccent),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Split Bill Now',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
