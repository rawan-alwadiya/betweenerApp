import 'package:bootcamp_starter/core/widgets/custom_text.dart';
import 'package:bootcamp_starter/features/main_app/widgets/custom_floating_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../core/util/constants.dart';
import '../../core/util/constants.dart';


class ReceiveView extends StatelessWidget {
  static String id = '/receiveView';

  const ReceiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40,),
            const Text('Active Sharing',style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: kPrimaryColor,
            ),),
             const SizedBox(height: 40,),
            Image.asset('assets/imgs/active_sharing.png',
            width:400,
              height: 250,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 3,
                  itemBuilder: (BuildContext context,  int index){
                    return ReciverListView();
                  }),
            ),

            // const CustomFloatingNavBar(currentIndex: 0),

          ],
        ),
      ),

    );
  }
}

class ReciverListView extends StatelessWidget {
  const ReciverListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 70,
      margin: EdgeInsets.only(bottom:10 ),
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: kLightPrimaryColor
      ),
      child:  ListTile(
        leading:Icon(Icons.person,size: 34,color: Colors.black,),
          title: CustomText( text: 'ahmed Ali',fontSize: 18,),
        // contentPadding: EdgeInsets.only(left: 20),


      ),
    );
  }
}
