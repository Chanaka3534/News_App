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
            const Positioned(
                top: 20,
                left: 20,
                child: Icon(Iconsax.menu_1, color: Colors.white)),
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
                      'https://www.google.com/imgres?q=anime%20profile%20pictures&imgurl=https%3A%2F%2Fimage.lexica.art%2Ffull_jpg%2F19f280a2-2b97-4be2-b782-1fd5c70b84f4&imgrefurl=https%3A%2F%2Flexica.art%2Fprompt%2F4b32ed77-c13c-490e-9cfc-9d1dc832a134&docid=0PHT5sbLOl3-gM&tbnid=itgUKub2a6sSrM&vet=12ahUKEwjU18GG0u-IAxUaxjgGHbstMzUQM3oECGYQAA..i&w=2560&h=2560&hcb=2&ved=2ahUKEwjU18GG0u-IAxUaxjgGHbstMzUQM3oECGYQAA',
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
