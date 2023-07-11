import 'package:bootcamp_starter/features/home/qr_scan.dart';
import 'package:bootcamp_starter/features/home/widgets/show_link.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  static String id = '/homeView';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 12
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  iconSize: 24,
                  onPressed: () {},
                ),
                // SizedBox(width: 12,),
                IconButton(
                  icon: Icon(Icons.qr_code_2_outlined),
                  iconSize: 24,
                  onPressed: () {
                    Navigator.pushNamed(context, ScanCode.id);
                  },

                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Text('Hello, Ahmed!', style: GoogleFonts.roboto(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.1
            ),),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20,left: 34, right: 34),
            child: Image.asset(
              'assets/imgs/qrCode.png',
              width: 317.72,
              height: 366.58,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: 198.0,
            height: 2.0,
            margin: EdgeInsets.only(top: 30, left: 81.0,right: 81,bottom: 35),
            decoration: BoxDecoration(
              border: Border.all(width: 2.2),
            ),
          ),
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ShowLink(title: 'Facebook', account: '@rawan'),
                ShowLink(title: 'Instagram', account: '@rawan'),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 143,
                    height: 90,
                    margin: EdgeInsets.only(left: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFFE7E5F1),
                    ),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.add_outlined),
                          color: Color(0xFF2D2B4E),
                        ),
                        Text('Add Link', style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            letterSpacing: 0.1,
                            color: Color(0xFF2D2B4E)
                        ),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



