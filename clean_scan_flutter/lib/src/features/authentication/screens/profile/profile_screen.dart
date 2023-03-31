import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project_nhk/src/constants/colors.dart';
import 'package:project_nhk/src/constants/sizes.dart';
import 'package:project_nhk/src/features/authentication/screens/profile/update_profile_screen.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../controllers/login_controller.dart';
import '../coming_soon/coming_soon.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var con = Get.put(LoginController());
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    var user = FirebaseAuth.instance.currentUser;
    var userEmail = user?.email;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left),
          ),
          title: Text(tProfileTitle,
              style: Theme.of(context).textTheme.headlineSmall),
          actions: [
            IconButton(
                onPressed: ()
                  => Get.to(() => const ComingSoonScreen()),
                icon: Icon(
                    isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon)),
          ],
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
                        onTap:  () => Get.to(() => const UpdateProfileScreen()) ,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: tPrimaryColor,
                          ),
                          child: const Icon(LineAwesomeIcons.alternate_pencil,
                              size: 20, color: Colors.black),
                        ),
                      ),
                    ),

                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  tProfileHeading,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  //email
                  userEmail!  ,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => const UpdateProfileScreen()),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: tPrimaryColor,
                          side: BorderSide.none,
                          shape: const StadiumBorder()),
                      child: const Text(tEditProfile,
                          style: TextStyle(color: tDarkColor)),
                    )),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 50),

                ///Menu
                ProfileMenuWidget(title: "Profile",icon: LineAwesomeIcons.user_cog,onPress: () => Get.to(() => const ComingSoonScreen())),
                ProfileMenuWidget(title: "Contact Us",icon: LineAwesomeIcons.envelope,onPress: () => Get.to(() => const ComingSoonScreen())),
                ProfileMenuWidget(title: "About Us",icon: LineAwesomeIcons.info_circle,onPress: () => Get.to(() => const ComingSoonScreen())),
                const SizedBox(height: 20),
                ProfileMenuWidget(title: "Logout",icon: LineAwesomeIcons.alternate_sign_out,textColor: Colors.red,endIcon: false,onPress: () => AuthenticationRepository.instance.logout()),
              ],
            ),
          ),
        ));
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {

    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark ;
    var iconColor = isDark ? tPrimaryColor : tAccentColor ;

    return ListTile(
        onTap: onPress,
        leading: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: iconColor.withOpacity(0.1),
          ),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.apply(color: textColor),
        ),
        trailing: endIcon?  Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: const Icon(LineAwesomeIcons.angle_right , size: 18 ,color: Colors.grey) ,
        ): null,
    );
  }
}
