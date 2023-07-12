import 'package:bootcamp_starter/features/home/qr_scan.dart';
import 'package:bootcamp_starter/features/home/widgets/show_link.dart';
import 'package:bootcamp_starter/provider/link_provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../api/api_response.dart';
import '../../api/users_api.dart';
import '../../prefs/shared_pref_controller.dart';
class HomeView extends StatefulWidget {
  static String id = '/homeView';
  const HomeView({super.key});



  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getLocation();
  }
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
      body: Consumer<LinkProvider>(
          builder: (_, linkProvider, __){
            if (linkProvider.linkList.status == Status.LOADING) {
              return const Center(child: CircularProgressIndicator(),);
            }
            if (linkProvider.linkList.status == Status.ERROR) {
              return const Center(child: Text('Error during fetching links '),);
            }
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Text('Hello, '+(SharedPreController().getValueFor<String>(key: Prefkeys.name.name)??''),
                    style: GoogleFonts.roboto(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.1
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 34, right: 34),
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
                  margin: EdgeInsets.only(top: 30, left: 81.0, right: 81, bottom: 35),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.2),
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: linkProvider.linkList.data?.length,
                    itemBuilder: (context ,index){
                      return ShowLink(
                          title: linkProvider.linkList.data![index].title!,
                          account: linkProvider.linkList.data![index].link!
                      );
                    },
                  ),
                ),
              ],
            );
          }

      ),
    );

  }
  void getLocation()async{
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position.latitude);
    print(position.longitude);
    UsersApi().update_location(id: SharedPreController().getValueFor(key: Prefkeys.id.name),
        lat: position.latitude.toString(), long: position.longitude.toString());


  }
}



