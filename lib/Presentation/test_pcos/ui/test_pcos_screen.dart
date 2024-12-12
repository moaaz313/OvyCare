import 'package:flutter/material.dart';
import 'package:ovacare/Core/Widgets/custom_app_bar.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';

import 'widgets/question_list.dart';

class TestPCOSScreen extends StatelessWidget {
  const TestPCOSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "PCOS Test",useIconButton: true,backgroundColor: ColorStyle.pink,),
      body: QuestionList(),
    );
  }
}
