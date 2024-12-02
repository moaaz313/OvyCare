import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Widgets/Custom_Button.dart';

import '../../../../../../Core/themes/Colors/ColorsStyle.dart';

class LanguageView extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageView> {
  String _selectedLanguage = 'English'; // Default selected language

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language',
            style: TextStyle(
                color: ColorStyle.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ColorStyle.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose your preferred language:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('English', style: TextStyle(fontSize: 16)),
              leading: Radio<String>(
                value: 'English',
                groupValue: _selectedLanguage,
                onChanged: (String? value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                },
                activeColor: Colors.purple,
              ),
            ),
            ListTile(
              title: const Text('Arabic', style: TextStyle(fontSize: 16)),
              leading: Radio<String>(
                value: 'Arabic',
                groupValue: _selectedLanguage,
                onChanged: (String? value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                },
                activeColor: Colors.purple,
              ),
            ),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: CustomButton(
                    name: 'Save',
                    height: 45.h,
                    FontSize: 22.spMin,
                    ontap: () {
                      // Save selected language and navigate back
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Language set to $_selectedLanguage'),
                        ),
                      );
                      Navigator.pop(context);
                    })),
          ],
        ),
      ),
    );
  }
}
