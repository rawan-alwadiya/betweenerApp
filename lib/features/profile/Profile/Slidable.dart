
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';




class SlidableSocial extends StatelessWidget {

  final String URL;
  final String SocialMedia;

  SlidableSocial(this.URL, this.SocialMedia);

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
            height: 85,
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20)
            ),
            child: ListTile(
              title: Text('$SocialMedia'),
              subtitle: Text('$URL'),
            ),
          ),
        );
  }
}


