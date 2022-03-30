import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {

  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser(){

      try {
        final user = _authentication.currentUser;
        if(user != null){
          loggedUser = user;
          print(loggedUser!.email);
        }
      } on Exception catch (e) {
        print(e);
      }

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title:const Text('우리말로하자'),
        actions: [
          IconButton(
              onPressed: (){
                _authentication.signOut();
                Navigator.pop(context);
              },
              icon: const Icon(
            Icons.exit_to_app_sharp,
                color: Colors.white,
          ),
          ),
        ],
      ),
      body: const Center(
        child: Text('말로하자~~~~'),
      ),
    );
  }
}