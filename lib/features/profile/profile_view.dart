import 'package:flutter/material.dart';

import 'Profile/Slidable.dart';
import 'Profile/identification.dart';



class ProfileView extends StatefulWidget {
  static String id = '/profileView';
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Profile",style: TextStyle(fontSize: 20,color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          identification(),

          SizedBox(
            height: 400,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return SlidableSocial('URL', 'SocialMedia');
              },),
          ),
          SizedBox(height: 10,),
          Padding(
            padding:  EdgeInsets.only(right: 30),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/FriendProfile");
                },
                backgroundColor:  Colors.deepPurpleAccent,
                child: Icon(Icons.add),),
            ),
          ),
          SizedBox(height: 10,)

        ],
      ),
    );
  }
}

