import 'package:flutter/material.dart';

import '../../../core/util/assets.dart';

class identification extends StatelessWidget {

  final String name;
  final String email;
  final String mobile;


  identification({this.name = 'ansam', this.email= 'ansam.com.gamil', this.mobile='0590000'});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126,
      width: 350,

       margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 14,

          ),
          const Center(
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
              Text("$email",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize: 10 ),),
              Text("$mobile",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize: 10 ),),
              Spacer()
            ],
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.white,)),
          Spacer()
        ],
      ),
    );
  }
}
