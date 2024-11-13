import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Notifier extends ChangeNotifier {


    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    // send msg
    Future<void> sendMessage(String receiverId, String message) async{
      // get current user info
      // final String currentUserId = _firebaseAuth.currentUser!.uid;
      //  final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
      final Timestamp timestamp = Timestamp.now();
      // create a new msg

      // construct chatt room id from current user id and receiver id (sorted to ensure unique)


      //add new msg to database
    }


    // get msg
}