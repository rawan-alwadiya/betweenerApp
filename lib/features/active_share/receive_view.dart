import 'package:bootcamp_starter/features/main_app/widgets/custom_floating_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../core/util/constants.dart';


class ReceiveView extends StatelessWidget {
  static String id = '/receiveView';

  const ReceiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              const Text('Active Sharing',style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: kPrimaryColor,
              ),),
               const SizedBox(height: 10,),
              Image.asset('assets/imgs/active_sharing.png',
              width:400,
                height: 250,
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                    itemBuilder: (BuildContext context,  int index){
                      return Padding(
                        padding: const EdgeInsets.only(left: 50,bottom: 20,right: 50),
                        child: Container(
                          width: 10,
                          height: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Colors.grey
                          ),
                          child: const ListTile(
                            leading:Icon(Icons.person,size: 28,color: Colors.black,),
                              title: Text('Dina Almasri'),
                            contentPadding: EdgeInsets.only(left: 20),


                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 20,),
              const CustomFloatingNavBar(currentIndex: 0),

            ],
          ),
        ),

    );
  }
}
