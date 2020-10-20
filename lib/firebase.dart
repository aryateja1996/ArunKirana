export 'package:firebase_auth/firebase_auth.dart';

export 'package:firebase_core/firebase_core.dart';

export 'package:cloud_firestore/cloud_firestore.dart';

export 'package:firebase_storage/firebase_storage.dart';

export 'package:google_sign_in/google_sign_in.dart';

export 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

export './Pages/Auth/signin&out.dart';

//import "package:firebase_database/firebase_database.dart";

import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CurrentUser {
  User user = FirebaseAuth.instance.currentUser;
}

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name, String address) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'address': address,
    });
  }
}
