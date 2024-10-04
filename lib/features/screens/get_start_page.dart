import 'package:flashnews/features/screens/home_screen.dart';
import 'package:flashnews/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = CHelperFunction.screenHeight(context);
    final width = CHelperFunction.screenWidth(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: height * 0.06),
          Text(
            'Welcome to FlashNews',
            style: GoogleFonts.amita(
                textStyle:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: width * 0.75,
              height: width * 0.75,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/animation/onboarding.gif'))),
            ),
          ),
          Text(
            'Discover the World of News',
            style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Get real-time updates on global headlines, personalized news, and stories that matter to you. Stay informed, anytime, anywhere!',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 18,
              )),
            ),
          ),
          SizedBox(height: height * 0.06),
          SizedBox(
            width: width * 0.5,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.white),
              child: const Text(
                'Get Start',
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
