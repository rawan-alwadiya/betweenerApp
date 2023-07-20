import 'package:bootcamp_starter/api/active_sharing.dart';
import 'package:bootcamp_starter/core/widgets/custom_text.dart';
import 'package:bootcamp_starter/models/Users.dart';
import 'package:bootcamp_starter/models/search_model.dart';
import 'package:bootcamp_starter/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/util/constants.dart';


class ReceiveView extends StatefulWidget {
  static String id = '/receiveView';

  const ReceiveView({super.key});

  @override
  State<ReceiveView> createState() => _ReceiveViewState();
}

class _ReceiveViewState extends State<ReceiveView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      FutureBuilder<List<String>>(
          future: ActiveSharing().nearestSender(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Padding(
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
                    InkWell(
                      onTap: (){
                        ActiveSharing().setActive('sender');
                      },
                      child: Image.asset('assets/imgs/active_sharing.png',
                        width:400,
                        height: 250,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 88,),
                        ElevatedButton(
                            onPressed: (){
                              ActiveSharing().setActive('receiver');
                              ActiveSharing().nearestSender();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:Colors.green,
                              // backgroundColor: Color(0xff40A798),
                              minimumSize: Size(100, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Reciever',style: GoogleFonts.roboto(
                                color: Colors.white
                            ),)),
                        SizedBox(width: 10,),

                        // SizedBox(width: 10,),
                        ElevatedButton(
                            onPressed: (){
                              ActiveSharing().removeActive();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              // backgroundColor: Color(0xff40A798),
                              minimumSize: Size(100, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Stop',style: GoogleFonts.roboto(
                                color: Colors.white
                            ),)),
                      ],
                    ),

                    // const CustomFloatingNavBar(currentIndex: 0),
                  ],
                ),
              );
            }else if(snapshot.hasData && snapshot.data!.isNotEmpty){
              Padding(
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
                    InkWell(
                      onTap: (){},
                      child: Image.asset('assets/imgs/active_sharing.png',
                        width:400,
                        height: 250,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 88,),
                        ElevatedButton(
                            onPressed: (){
                              ActiveSharing().setActive('Reciever');
                              ActiveSharing().nearestSender();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:Colors.green,
                              // backgroundColor: Color(0xff40A798),
                              minimumSize: Size(100, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Reciever',style: GoogleFonts.roboto(
                                color: Colors.white
                            ),)),
                        SizedBox(width: 10,),

                        // SizedBox(width: 10,),
                        ElevatedButton(
                            onPressed: (){
                              ActiveSharing().removeActive();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              // backgroundColor: Color(0xff40A798),
                              minimumSize: Size(100, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Stop',style: GoogleFonts.roboto(
                                color: Colors.white
                            ),)),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (BuildContext context,  int index){
                            return Container(
                              height: 70,
                              margin: EdgeInsets.only(bottom:10 ),
                              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                  color: kLightPrimaryColor
                              ),
                              child:  ListTile(
                                leading:Icon(
                                  Icons.person,
                                  size: 34,
                                  color: Colors.black,
                                ),
                                title: CustomText( text: snapshot.data![index],fontSize: 18,),
                                // contentPadding: EdgeInsets.only(left: 20),


                              ),
                            );
                          }),
                    ),

                    // const CustomFloatingNavBar(currentIndex: 0),
                  ],
                ),
              );
            }
            {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40,),
                    const Text('Active Sharing', style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),),
                    const SizedBox(height: 40,),
                    InkWell(
                      onTap: () {},
                      child: Image.asset('assets/imgs/active_sharing.png',
                        width: 400,
                        height: 250,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 88,),
                        ElevatedButton(
                            onPressed: (){
                              ActiveSharing().setActive('Receiver');
                              ActiveSharing().nearestSender();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:Colors.green,
                              // backgroundColor: Color(0xff40A798),
                              minimumSize: Size(100, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Receiver',style: GoogleFonts.roboto(
                                color: Colors.white
                            ),)),
                        SizedBox(width: 10,),

                        // SizedBox(width: 10,),
                        ElevatedButton(
                            onPressed: (){
                              ActiveSharing().removeActive();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              // backgroundColor: Color(0xff40A798),
                              minimumSize: Size(100, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Stop',style: GoogleFonts.roboto(
                                color: Colors.white
                            ),)),
                      ],
                    ),

                    // const CustomFloatingNavBar(currentIndex: 0),
                  ],
                ),
              );
            }
          }
      ),


    );
  }
}

