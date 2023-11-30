import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'app_color.dart';
import 'local_storage.dart';
import 'nav_bar.dart';


String? _Image;
String? name;

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var textCon;

  @override
  void initState() {
    super.initState();

    AppLocal.getName().then((value) {
      setState(() {
        name = value;
      });
    });
    textCon = TextEditingController(text: name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (_Image != null && name != null) {
                  AppLocal.cacheIsUpload(true);
                  AppLocal.cacheName(name ?? '');
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const NavBarView(),
                  ));
                } else if (_Image == null && name == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                          'Please Upload Your Image and Enter Your Name')));
                } else if (_Image == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Please Upload Your Image')));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Please Enter your Name')));
                }
              },
              child: const Text('Done'))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                  future: AppLocal.getImage(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: AppColor.white,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: FileImage(File(snapshot.data!)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    backgroundColor: AppColor.containerBG,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          await getImagefromCamera()
                                              .then((value) {
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 200,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: AppColor.grey),
                                          child: Text(
                                            'Upload from Camera',
                                            style: TextStyle(
                                                color: AppColor.white),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await getImagefromGallery()
                                              .then((value) {
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 200,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: AppColor.grey),
                                          child: Text(
                                            'Upload from Gallery',
                                            style: TextStyle(
                                                color: AppColor.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: AppColor.scaffoldBG,
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColor.white,
                        child: const CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage('assets/user.png')),
                      );
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Divider(
                  color: AppColor.lemonada,
                ),
              ),
              TextFormField(
                controller: textCon,
                onFieldSubmitted: (value) {
                  if (name!.isNotEmpty) {
                    AppLocal.cacheName(name ?? '');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Please Enter your Name')));
                  }
                },
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                style: TextStyle(color: AppColor.lemonada),
                decoration: const InputDecoration(
                  hintText: 'Enter Your Name',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future getImagefromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      AppLocal.cacheImage(pickedImage.path);
      setState(() {
        _Image = pickedImage.path;
      });
    }
  }

  Future getImagefromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      AppLocal.cacheImage(pickedImage.path);
      setState(() {
        _Image = pickedImage.path;
      });
    }
  }
}
