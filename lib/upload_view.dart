import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'app_color.dart';
import 'local_storage.dart';
import 'nav_bar.dart';

String? _Image;
String? name;

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  var textCon = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   AppLocal.getImage().then((value) {
  //     setState(() {
  //       _Image = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
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
              CircleAvatar(
                radius: 60,
                backgroundColor: AppColor.grey,
                backgroundImage: (_Image != null)
                    ? FileImage(File(_Image!)) as ImageProvider
                    : const AssetImage(
                        'assets/user.png',
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  await getImagefromCamera();
                },
                child: Container(
                  height: 40,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.containerBG),
                  child: Text(
                    'Upload from Camera',
                    style: TextStyle(color: AppColor.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  await getImagefromGallery();
                },
                child: Container(
                  height: 40,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.containerBG),
                  child: Text(
                    'Upload from Gallery',
                    style: TextStyle(color: AppColor.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Divider(
                  color: AppColor.lemonada,
                ),
              ),
              TextField(
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

  getImagefromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      AppLocal.cacheImage(pickedImage.path);
      setState(() {
        _Image = pickedImage.path;
      });
    }
  }

  getImagefromGallery() async {
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
