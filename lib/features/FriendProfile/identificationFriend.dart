import 'package:flutter/material.dart';

import '../../core/util/assets.dart';

class identificationFriend extends StatelessWidget {

  final String name;
  final String email;



  identificationFriend({this.name = 'ansam', this.email= 'ansam.com.gamil'});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126,
      width: 350,
       margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 12,
          ),
          Center(
            child: CircleAvatar(
              maxRadius: 40,
              backgroundImage: AssetImage(AssetsData.user),
            ),
          ),
          Spacer(),
          Column(
            children: [
              Spacer(),
              Text("$name",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize: 20 ),),
              Text("$email",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize: 10 ),),Spacer(),
             Container(
                width: 100,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ElevatedButton(

                    onPressed: (){}, child: Text('Follow')),
              ),
              Spacer()
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Spacer(),

        ],
      ),
    );
  }
}
