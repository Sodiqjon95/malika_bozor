import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Email"),
              Text(user.email ?? ""),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Name:"),
              Text(user.displayName ?? ""),
              user.photoURL == null
                  ? const SizedBox()
                  : Image.network(
                      user.photoURL!,
                      height: 100,
                      width: 100,
                    )
            ],
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.currentUser!
                  .updateDisplayName("Ibrohim");
            },
            child: const Text("Ism qo'sh"),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.currentUser!.updatePhotoURL(
                  "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png");
              setState(() {});
            },
            child: const Text("Image Url qoshish"),
          ),
        ],
      ),
    );
  }
}
