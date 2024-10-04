import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Drawerlist extends StatelessWidget {
  const Drawerlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Home
        ListTile(
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Iconsax.home,
              size: 32,
            ),
          ),
          title: const Text(
            'Home',
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {},
        ),

        ///Theme
        ListTile(
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Iconsax.brush_2,
              size: 32,
            ),
          ),
          title: const Text(
            'Theme',
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {},
        ),

        ///Setting
        ListTile(
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Iconsax.setting,
              size: 32,
            ),
          ),
          title: const Text(
            'Setting',
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {},
        ),

        ///Help
        ListTile(
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Iconsax.message_question,
              size: 32,
            ),
          ),
          title: const Text(
            'Help?',
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {},
        ),

        ///Upgrade to Pro
        ListTile(
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Iconsax.award,
              size: 32,
            ),
          ),
          title: const Text(
            'Upgrade To Pro',
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {},
        ),

        ///version
        ListTile(
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Iconsax.route_square4,
              size: 32,
            ),
          ),
          title: const Text(
            'Version',
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {},
        ),

        ///Invite to friends
        ListTile(
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Iconsax.user_add,
              size: 32,
            ),
          ),
          title: const Text(
            'Invite to friends',
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {},
        ),

        ///Divider
        const Divider(
          endIndent: 20,
          color: Colors.black,
          indent: 20,
          thickness: 1,
        ),

        ///Delete Account
        ListTile(
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Iconsax.close_circle,
              size: 32,
            ),
          ),
          title: const Text(
            'Delete account',
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
          onTap: () {},
        ),

        ///LogOut
        ListTile(
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Iconsax.logout_1,
              size: 32,
            ),
          ),
          title: const Text(
            'Logout',
            style: TextStyle(fontSize: 18),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
