import 'package:flutter/material.dart';

import '../../models/result_data.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.resultData});

  final ResultData resultData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Text(resultData.equalDivided),
          ],
        ),
      )),
    );
  }
}
