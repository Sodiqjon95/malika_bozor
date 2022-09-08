import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:malika_bozor/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HomePage",
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Are you sure you want to log out?"),
                        actions: [
                          OutlinedButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.pop(context);
                            },
                            child: Text("Yes"),
                          ),
                          OutlinedButton(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              child: Text("No"))
                        ],
                      );
                    });
              },
              icon: Icon(Icons.logout)),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, profilePage);
            },
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "User email",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              user.email ?? "",
              style: const TextStyle(fontSize: 20),
            ),

          ],
        ),
      ),
    );
  }
}
