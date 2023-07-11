import 'package:bootcamp_starter/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../core/util/constants.dart';
import '../FriendProfile/SlidableFriend.dart';
import '../FriendProfile/user_card_friend.dart';



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
        title: Text("Ahmed Ali",style: TextStyle(fontSize: 20,color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon(Icons.arrow_back_ios,color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: SingleChildScrollView(
          child: Column(

            children: [
              UserCardFriend(),
          SizedBox(
            height: 30,
          ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return ListViewLink(index);
                },),



            ],
          ),
        ),
      ),
    );
  }
  Widget ListViewLink(int index){
    Color colorText = index % 2 == 0 ? kOnLightDangerColor : kPrimaryColor;
    Color colorContainer = index % 2 == 0 ? Color(0xFFFEE2E7): Color(0xFFE7E5F1);
    return Container(
      width: double.infinity,
      height: 80,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: colorContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: 'Instagram',color:colorText,),
          SizedBox(height: 4,),
          CustomText(text: 'https://www.instagram.com/a7medhq/',color: colorText,),
        ],
      ),
    );
  }
}
