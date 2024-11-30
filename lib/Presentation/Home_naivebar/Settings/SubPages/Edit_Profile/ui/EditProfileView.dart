import 'dart:io';
import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:date_picker_textfield/date_picker_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../Core/Widgets/Custom_Textfromfield.dart';

class edit_profile extends StatefulWidget {
  const edit_profile({Key? key}) : super(key: key);

  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  bool obscure = true, waitt = false;
  List fieldsName = ['Full Name', 'Email', 'Date of Birth'];
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _bio = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late List<TextEditingController> fieldsController;

  // final storage = FirebaseStorage.instance.ref().child("images");
  // final auth = FirebaseAuth.instance;
  // final user = FirebaseFirestore.instance.collection("accounts").doc("${FirebaseAuth.instance.currentUser?.email}");
  File? selectedImage;
  var photo, filePath;
  final picker = ImagePicker();
  var result;
  var pic, Url;

  String? _validateInput(String? value, var hinttext) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (hinttext == 'Email' && !GetUtils.isEmail(value)) {
      return 'Please enter a valid email address';
    }
    if (hinttext == 'Password' && value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (hinttext == 'Name' && value.length < 4) {
      return 'Name must be at least 4 characters long';
    }
    return null;
  }

  // _pickFile(var res) async {
  //   if (res == null) return;
  //   try {
  //     var store = FirebaseStorage.instance.ref();
  //     var rName = Random().nextInt(100000);
  //     final pathh = "files/$rName${res.name}";
  //     final file = File(res.path!);
  //     final upload = await store.child(pathh).putFile(file);
  //     Url = await store.child(pathh).getDownloadURL();
  //
  //     await FirebaseFirestore.instance
  //         .collection("accounts")
  //         .doc("${auth.currentUser?.email}")
  //         .update({
  //       "name": "${_name.text}",
  //       "password": "${_pass.text}",
  //       "bio": "${_bio.text}",
  //       "photo": "$Url"
  //     }).then((value) async {
  //       await auth.currentUser!.updateProfile(displayName: _name.text, photoURL: Url.toString());
  //     });
  //   } catch (e) {
  //     print("ERROR: $e");
  //   }
  // }
  var password;
  // Future<void> get_password() async {
  //   try {
  //     var userEmail = await FirebaseAuth.instance.currentUser?.email;
  //     if (userEmail != null) {
  //       var documentSnapshot = await FirebaseFirestore.instance
  //           .collection('accounts')
  //           .doc(userEmail)
  //           .get();
  //
  //       if (documentSnapshot.exists) {
  //         setState(() async {
  //           _pass.text = await documentSnapshot.get('password');
  //           password = await documentSnapshot.get('password');
  //           _bio.text = await documentSnapshot.get('bio');
  //         });
  //       } else {
  //         print('Document does not exist');
  //       }
  //     }
  //   } catch (e) {
  //     print('Error fetching password: $e');
  //   }
  // }

  Future<void> _pickImageFromGallery() async {
    try {
      result = await picker.pickImage(source: ImageSource.gallery);
      if (result != null) {
        setState(() {
          selectedImage = File(result.path);
          filePath = selectedImage;
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
List icons = [
  Icon(Icons.person,size: 22.h,color: ColorStyle.gray,),
  Icon(Icons.email,size: 22.h,color: ColorStyle.gray,),
  Icon(Icons.date_range,size: 22.h,color: ColorStyle.gray,),
];
  @override
  void initState() {
    super.initState();
    // get_password();
    _name.text = 'auth.currentUser!.displayName!';
    _email.text = 'auth.currentUser!.email!';
    // photo = auth.currentUser!.photoURL.toString();
    fieldsController = [_name, _email, _bio];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color:ColorStyle.lightwhite
              ),
            ),
          ),
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorStyle.pink,
                    ColorStyle.purplefav,

                  ],
                )
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 5,
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                  margin: const EdgeInsets.fromLTRB(20, 190, 20, 0),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "    Hello..",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:  Colors.black,
                                ),
                              ),
                              Text(
                                " dd",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:  Color(0xff2393FF)
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        for (int i = 0; i < fieldsName.length; i++)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                fieldsName[i],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              // DatePicker(
                              //   type: MyDatePickerFieldTypes.all,
                              //   controller: _bio,
                              //   context: context,
                              //   label: 'Due Date',
                              //   initialDate: DateTime.now(),
                              //   firstDate: DateTime.now()),

                                CustomTextfromfield(hintText: fieldsName[i], Controller:  fieldsController[i],prefixIcon: icons[i],),
                              // Container(
                              //   height: 50,
                              //   child: TextFormField(
                              //     validator: (value) => _validateInput(value, fieldsName[i]),
                              //     onTapOutside: (v) {
                              //       FocusManager.instance.primaryFocus?.unfocus();
                              //     },
                              //     controller: fieldsController[i],
                              //     readOnly: fieldsName[i] == 'Email' ? true : false,
                              //     style: TextStyle(
                              //       fontSize: 20,
                              //       color:  Colors.black,
                              //       fontWeight: FontWeight.bold,
                              //     ),
                              //     obscureText: fieldsName[i] == 'Password' ? obscure : false,
                              //     decoration: InputDecoration(
                              //       border: const UnderlineInputBorder(),
                              //       suffixIcon: fieldsName[i] == 'Password'
                              //           ? IconButton(
                              //         onPressed: () {
                              //           setState(() {
                              //             obscure = !obscure;
                              //           });
                              //         },
                              //         icon: obscure
                              //             ? Icon(
                              //           CupertinoIcons.eye_slash_fill,
                              //           color:  Color(0xff2393FF)
                              //         )
                              //             : Icon(
                              //           CupertinoIcons.eye,
                              //           color: Color(0xff2393FF)
                              //         ),
                              //       )
                              //           : null,
                              //       hintText: fieldsName[i],
                              //       hintStyle: TextStyle(color:Colors.grey,
                              //           fontSize: 20),
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(height: 15),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Container(
            decoration: BoxDecoration(
              color:ColorStyle.purplefav,
              borderRadius: BorderRadius.circular(100),
            ),
            margin: const EdgeInsets.only(top: 80, left: 15),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage:AssetImage('assets/food.png'),
                  // selectedImage == null?
                  //     NetworkImage('photo'),
                      // : FileImage(selectedImage!) as ImageProvider,
                  child: FullScreenWidget(
                    disposeLevel: DisposeLevel.High,
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: "s",
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/food.png'),
                            // selectedImage == null
                            //     ? NetworkImage(photo)
                            //     : FileImage(selectedImage!) as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(110, 120, 20, 0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 20,
                    child: IconButton(
                      onPressed: () {
                        _pickImageFromGallery();
                      },
                      icon: const Icon(CupertinoIcons.camera_fill, size: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            // child: Align(
            //   alignment: Alignment.bottomCenter,
            //   child: !waitt
            //       ? CustomButton(
            //     onTap: () async {
            //       if (_formKey.currentState!.validate()) {
            //         setState(() {
            //           waitt = !waitt;
            //         });
            //         print("d1");
            //         password==_pass.text?null:await auth.currentUser!.updatePassword(_pass.text).then((value) => print('d2'),);
            //         await _pickFile(result);
            //         Future.delayed(const Duration(seconds:3), () {
            //           print("donnnnnnnnnnnnnnnne");
            //           if (mounted) {
            //             Fluttertoast.showToast(
            //               msg: "           Saved           ",
            //               toastLength: Toast.LENGTH_SHORT,
            //               textColor: Colors.white,
            //               fontSize: 18,
            //               gravity: ToastGravity.CENTER,
            //               backgroundColor: accentPurpleColor,
            //             ).then((value) =>
            //                 Get.to(() => settings("${_name.text}", "${Url}")));
            //           }
            //         });
            //       }
            //     },
            //     text: "Save",
            //     width: 150.0,
            //     height: 50.0,
            //   )
            //       : CircularProgressIndicator(),
            // ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Get.to(() => settings("${auth.currentUser!.displayName}","${auth.currentUser!.photoURL}"));
                      },
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    const SizedBox(width: 100),
                    const Text(
                      "Edit Profile",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}