
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../core/widgets/custom_text.dart';



class SlidableSocialFriend extends StatelessWidget {

  final String URL;
  final String SocialMedia;

  SlidableSocialFriend(this.URL, this.SocialMedia);

  @override
  Widget build(BuildContext context) {
    return Slidable(
       endActionPane:  ActionPane(motion: BehindMotion(),
            children: [
              Container(
                width: 85,
                height: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                child: SlidableAction(
                  backgroundColor: Colors.green,
                  icon: Icons.edit,
                  onPressed:(context){},

                ),
              ),
              Container(
                width: 85,
                height: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                child: SlidableAction(
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                  onPressed:(context){},
                ),
              )
            ],),
          child: Container(
            width: double.infinity,
            height: 80,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: Colors.lime,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'Instagram',color:Colors.brown,),
                SizedBox(height: 4,),
                CustomText(text: 'https://www.instagram.com/a7medhq/',color: Colors.brown,),
              ],
            ),
          ),
        );
  }
}


