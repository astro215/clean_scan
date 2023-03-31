import 'package:flutter/material.dart';
import 'package:project_nhk/src/features/authentication/screens/forgot_password/forgot_password_mail/forget_password_mail.dart';
import 'package:get/get.dart';

class ForgetPasswordBtnWidget extends StatelessWidget {
  const ForgetPasswordBtnWidget({
    required this.btnIcon,
    required this.title,
    required this.subTitle,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final IconData btnIcon;
  final String title, subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Get.to(() => const ForgetPasswordMailScreen());
        },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(btnIcon, size: 60.0),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.headline6),
                Text(subTitle, style: Theme.of(context).textTheme.bodyText2),
              ],
            )
          ],
        ),
      ),
    );
  }
}