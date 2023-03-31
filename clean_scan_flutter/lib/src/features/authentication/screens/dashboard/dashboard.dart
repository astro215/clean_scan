import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project_nhk/src/constants/colors.dart';
import 'package:project_nhk/src/constants/image_strings.dart';
import 'package:project_nhk/src/constants/text_strings.dart';
import 'package:get/get.dart';
import '../../../../constants/sizes.dart';
import '../coming_soon/coming_soon.dart';
import '../profile/profile_screen.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  final TextEditingController _controllerName = TextEditingController();

  final _db = FirebaseFirestore.instance;

  String imageUrl = '';

  String uniqueFileName = '';

  @override
  Widget build(BuildContext context) {
    // bool _isImageUploaded = false;
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? tPrimaryColor : tAccentColor;
    final txtTheme = Theme.of(context).textTheme;
    var user = FirebaseAuth.instance.currentUser;
    var userEmail = user?.email ?? 'Null';

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.to(() => const ComingSoonScreen()),
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        title: Text(tAppName, style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: tCardBgColor,
            ),
            child: IconButton(
              onPressed: () => Get.to(() => const ProfileScreen()),
              icon: const Image(
                image: AssetImage(tUserProfileImage),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(tDashboardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tDashboardTitle,
              style: txtTheme.titleLarge,
            ),
            SizedBox(
              height: 200,
              width: 300,
              child: Image.asset(tDash),
            ),

            const SizedBox(height: tDashboardPadding),
            SizedBox(
              width: 600,
              height: 400,
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextFormField(
                            controller: _controllerName,
                            decoration: const InputDecoration(
                                hintText: 'Complain/Description (Optional)'),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () async {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    child: Wrap(
                                      children: <Widget>[
                                        ListTile(
                                          leading: const Icon(
                                              LineAwesomeIcons.camera),
                                          title:
                                          const Text('Take a photo'),
                                          onTap: () async {
                                            Navigator.pop(context);

                                            final ImagePicker imagePicker =
                                            ImagePicker();
                                            final XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
                                            if (file != null) {
                                              // Do something with the image file
                                              print('Gallery image: ${file.path}');
                                            }

                                            uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

                                            Reference referenceRoot = FirebaseStorage.instance.ref();
                                            Reference referenceDirImages = referenceRoot.child('images');
                                            Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

                                            //Store the file

                                            try {
                                              await referenceImageToUpload
                                                  .putFile(File(file!.path));
                                              //get url
                                              imageUrl =
                                              await referenceImageToUpload
                                                  .getDownloadURL();
                                            } catch (error) {
                                              //
                                            }
                                          },
                                        ),
                                        ListTile(
                                          leading: const Icon(
                                              LineAwesomeIcons.photo_video),
                                          title:
                                              const Text('Choose from gallery'),
                                          onTap: () async {
                                            Navigator.pop(context);

                                            final ImagePicker imagePicker =
                                                ImagePicker();
                                            final XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                                            if (file != null) {
                                              // Do something with the image file
                                              print('Gallery image: ${file.path}');
                                            }

                                            uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

                                            Reference referenceRoot = FirebaseStorage.instance.ref();
                                            Reference referenceDirImages = referenceRoot.child('images');
                                            Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

                                            //Store the file
                                            try {await referenceImageToUpload.putFile(File(file!.path));
                                              //get url
                                              imageUrl = await referenceImageToUpload.getDownloadURL();
                                            } catch (error) {
                                              //
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Icon(
                              LineAwesomeIcons.camera,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () async {
                              String desc = _controllerName.text;
                              Position position =
                                  await Geolocator.getCurrentPosition();
                              String locationUrl =
                                  'https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}';

                              bool serviceEnabled;
                              LocationPermission permission =
                                  await Geolocator.requestPermission();

                              serviceEnabled =
                                  await Geolocator.isLocationServiceEnabled();
                              if (!serviceEnabled) {
                                return Future.error(
                                    'Location services are disabled');
                              }

                              permission = await Geolocator.checkPermission();
                              if (permission == LocationPermission.denied) {
                                permission =
                                    await Geolocator.requestPermission();
                                if (permission == LocationPermission.denied) {
                                  return Future.error(
                                      'Location permissions are denied');
                                }
                              }

                              if (permission ==
                                  LocationPermission.deniedForever) {
                                return Future.error(
                                    'Location permissions are permanently denied, we cannot request permissions.');
                              }

                              //Create a Map of data
                              Map<String, String> dataToSend = {
                                'Email': userEmail,
                                'ImageUrl': imageUrl,
                                'Location':
                                    '${position.latitude},${position.longitude}',
                                'LocationUrl': locationUrl,
                                'Description': desc,
                              };

                              //Add a new item
                              await _db
                                  .collection("main_db")
                                  .add(dataToSend)
                                  .whenComplete(() {
                                Get.snackbar(
                                    "Success", "Your complain is registered",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor:
                                        Colors.green.withOpacity(0.1),
                                    colorText: Colors.green);
                              });
                            },
                            child: Container(
                              width: 180,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.lightBlue.shade100,
                              ),
                              child: Stack(
                                children: const [
                                  Center(
                                    child: Text(
                                      'Click to clean',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
