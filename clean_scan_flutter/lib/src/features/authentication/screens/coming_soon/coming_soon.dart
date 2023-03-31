import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../profile/profile_screen.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
   build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            LineAwesomeIcons.angle_left,
            color: Colors.black,
          ),
        ),

          title: Text(tAppName, style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
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
      body: const Center(
        child: Text(
          'COMING SOON',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
