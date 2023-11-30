import 'package:flutter/material.dart';
import 'package:home_slice/constants/colors.dart';

Widget buildDrawer() {
  return Drawer(
    child: ListView(children: [
      Container(
        height: 300,
        decoration: const BoxDecoration(color: MyColors.myNavyBlue),
        child: const DrawerHeader(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                  'https://t3.ftcdn.net/jpg/05/64/57/00/240_F_564570063_8moqE2rAG9i19zIgKu0GHmH5BDNP0ecu.png'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Mohamed Hosny',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text('Mohamed@gmail.com',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        )),
      ),
      const SizedBox(
        height: 10,
      ),
      ListTile(
        leading: const Icon(Icons.help),
        title: const Text('Help'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('Settings'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.info),
        title: const Text('About'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.logout),
        title: const Text('LogOut'),
        onTap: () {},
      ),
    ]),
  );
}
