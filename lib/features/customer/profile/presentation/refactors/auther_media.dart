import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopify/core/extensions/context_extension.dart';
import 'package:shopify/core/utils/url_launcher.dart';

class AutherMedia extends StatelessWidget {
  const AutherMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: Card(
            elevation: 10,
            color: context.color.navBarbg!.withOpacity(.6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async {
                      const whatsapp = '+201556878109';
                      await urlLauncher(
                        context,
                        'whatsapp://send?phone=$whatsapp&text= السلام عليكم 👋 ',
                      );
                    },
                    icon: Icon(
                      FontAwesomeIcons.whatsapp,
                      color: Colors.green,
                      size: 28.sp,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await urlLauncher(
                        context,
                        'https://www.facebook.com/abdelmenam.adel.10',
                      );
                    },
                    icon: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                      size: 24.sp,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await urlLauncher(
                        context,
                        'https://github.com/AbdelmenamAdel/',
                      );
                    },
                    icon: Icon(
                      FontAwesomeIcons.github,
                      color: Colors.black,
                      size: 28.sp,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await urlLauncher(
                        context,
                        'https://www.linkedin.com/in/abdelmenam-adel-175b35265/',
                      );
                    },
                    icon: Icon(
                      FontAwesomeIcons.linkedinIn,
                      color: Colors.blue[300],
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
