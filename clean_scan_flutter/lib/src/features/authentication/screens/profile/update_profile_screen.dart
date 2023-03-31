import 'package:get/get.dart';
import 'package:flutter/material.dart%20';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(tEditProfile,
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                          image: AssetImage(tProfileImage),
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => Get.to(() => const UpdateProfileScreen()),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: tPrimaryColor,
                        ),
                        child: const Icon(LineAwesomeIcons.camera,
                            size: 20, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text(tFullName),
                        prefixIcon: Icon(Icons.person_outline_rounded)),
                  ),
                  const SizedBox(height: tFormHeight - 20),
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text(tEmail),
                        prefixIcon: Icon(Icons.email_outlined)),
                  ),
                  const SizedBox(height: tFormHeight - 20),
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text(tPhoneNo), prefixIcon: Icon(Icons.numbers)),
                  ),
                  const SizedBox(height: tFormHeight - 20),
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text(tPassword),
                        prefixIcon: Icon(Icons.fingerprint)),
                  ),
                  const SizedBox(height: tFormHeight),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: tPrimaryColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text(
                          "Update Profile",
                          style: TextStyle(color: tDarkColor),
                        ),

                      )),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text.rich(
                          TextSpan(
                              text: tJoined , style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                  text: tJoinedAt , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 12 )
                              )
                            ]
                          ),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent.withOpacity(0.1), foregroundColor: Colors.red,shape: const StadiumBorder(),side:BorderSide.none),
                          child: const Text(tDelete)),
                    ],
                  )

                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
