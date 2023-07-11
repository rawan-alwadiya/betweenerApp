import 'package:flutter/material.dart';

import '../../core/util/constants.dart';
import 'Profile/Slidable.dart';
import 'Profile/user_card_profile_widget.dart';
import 'friendProfile.dart';

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
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 20, color: kPrimaryColor),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                UserCardProfileWidget(),
                SizedBox(height: 20,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return SlidableSocial(index);
                  },
                ),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: InkWell(

            onTap: (){
             
              Navigator.push(context,MaterialPageRoute(builder: (context) {
                return FriendProfile();
              },));

          },
          child: Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 80),
              child:  CircleAvatar(
                backgroundColor: kPrimaryColor,
                maxRadius: 30,
                child:Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              ),
        ));
  }
}

