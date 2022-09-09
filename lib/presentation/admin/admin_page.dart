import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:malika_bozor/utils/my_utils.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Page"),
      ),
      body: Column(
        children: [
          TextButton(onPressed: addCategory2, child: Text("Create Category"))
        ],
      ),
    );
  }

  Future<void> addCategory1() async {
    try {
      CollectionReference categories =
          FirebaseFirestore.instance.collection('categories');
      await categories.doc("my_doc_id").set({
        "first_name": "Abdulloh",
        "last_name": "Falonchi",
      });
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }
  Future<void> addCategory2() async {
    try {
      CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');
      await categories.add({
        "first_name": "Abdulloh",
        "last_name": "Falonchi",
      });
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }
}
