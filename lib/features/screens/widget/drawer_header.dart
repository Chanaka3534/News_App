import 'package:flashnews/common_widget/rounded_container.dart';
import 'package:flashnews/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';

class Drawerheader extends StatelessWidget {
  const Drawerheader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = CHelperFunction.screenSize(context);
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          const Text(
            "Account",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 12,
          ),
          CRoundedContainer(
            image: const DecorationImage(image: NetworkImage('')),
            width: 90,
            height: 90,
            radius: 60,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(60)),
              child: Image.network(
                height: 80,
                width: 80,
                'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    'Assets/logo/profile.png',
                  );
                },
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          CRoundedContainer(
            width: size.width * 0.5,
            backgroundColor: Colors.blue,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Change Profile Picture",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Divider(
            endIndent: 20,
            color: Colors.black,
            indent: 20,
            thickness: 2,
          )
        ],
      ),
    );
  }
}
