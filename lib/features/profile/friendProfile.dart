import 'package:flutter/material.dart';

import '../FriendProfile/SlidableFriend.dart';
import '../FriendProfile/identificationFriend.dart';



class FriendProfile extends StatefulWidget {
  const FriendProfile({Key? key}) : super(key: key);

  @override
  State<FriendProfile> createState() => _FriendProfileState();
}

class _FriendProfileState extends State<FriendProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ansam",style: TextStyle(fontSize: 20,color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: () {  }, icon: Icon(Icons.arrow_back_ios,color: Colors.black),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          identificationFriend(),
      SizedBox(
        height: 30,
      ),
          SizedBox(
            height: 500,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return SlidableSocialFriend('URL', 'SocialMedia');
              },),
          ),
          Spacer(),

          SizedBox(height: 20,)

        ],
      ),
    );
  }
}
