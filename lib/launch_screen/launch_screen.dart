
import 'package:bootcamp_starter/features/auth/login_view.dart';
import 'package:bootcamp_starter/features/home/home_view.dart';
import 'package:bootcamp_starter/features/main_app/main_app_view.dart';
import 'package:bootcamp_starter/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchScreen extends StatefulWidget {
  static String id = '/launch_screen';
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      bool loggedIn = SharedPreController().getValueFor<bool>(key: Prefkeys.loggedIn.name) ?? false;
      String route = loggedIn? HomeView.id : MainAppView.id;
      Navigator.pushReplacementNamed(context,route);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF2D2B4E),
        alignment: AlignmentDirectional.center,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: AlignmentDirectional.topStart,
        //     end: AlignmentDirectional.bottomEnd,
        //     colors: [
        //       Color(0xFF40A798),
        //       Color(0xFF476269)
        //     ]
        //   )
        // ),
        child: Text('bootcamp_starter', style: GoogleFonts.pacifico(fontSize: 34,fontWeight: FontWeight.bold, color: Colors.white,),),
      ),
    );
  }
}
