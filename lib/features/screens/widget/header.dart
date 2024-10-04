import 'package:flashnews/common_widget/rounded_container.dart';
import 'package:flashnews/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: CHelperFunction.screenHeight(context) * 0.175,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
                image: const AssetImage('Assets/images/background.png'))),
        child: Stack(
          children: [
            Positioned(
                top: 20,
                left: 20,
                child: GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer(); // Open the drawer
                    },
                    child: const Icon(Iconsax.menu_1, color: Colors.white))),
            Center(
              child: Text(
                'FLASH NEWS',
                style: GoogleFonts.protestRevolution(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            Positioned(
                top: 10,
                right: 10,
                child: CRoundedContainer(
                  width: 60,
                  height: 60,
                  radius: 60,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Image.network(
                      'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          'Assets/logo/profile.png',
                        );
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
          ],
        ));
  }
}
