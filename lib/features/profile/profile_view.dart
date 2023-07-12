import 'package:bootcamp_starter/features/profile/AddLink.dart';
import 'package:bootcamp_starter/provider/link_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/api_response.dart';
import '../../core/util/constants.dart';
import 'Slidable.dart';
import 'user_card_profile_widget.dart';


class ProfileView extends StatefulWidget {
  static String id = '/profileView';

  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 20, color: kPrimaryColor),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Consumer<LinkProvider>(
          builder: (_, linkProvider, __) {
            if (linkProvider.linkList.status == Status.LOADING) {
              return SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
             child: Column(
            children: [
            UserCardProfileWidget(),
            SizedBox(height: 20,),const Center(
            child: CircularProgressIndicator(),
              )],
            )));
            }
                if (linkProvider.linkList.status == Status.ERROR) {
                  return SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Column(
                            children: [
                              UserCardProfileWidget(),
                              SizedBox(height: 20,),
                              const Center(
                                child: Text('Error during fetching links '),
                              )],
                          )));
            }
             return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    UserCardProfileWidget(),
                    SizedBox(height: 20,),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: linkProvider.linkList.data?.length,
                    itemBuilder: (context, index) {
                      return SlidableSocial(
                        index: index,
                        link : linkProvider.linkList.data![index],
                      );
                    },
                  ),
                  SizedBox(height: 50,
                  ),

           ]
    )
              )
            );
    }
    ),
        floatingActionButton: InkWell(

        onTap: (){

      Navigator.push(context,MaterialPageRoute(builder: (context) {
        return AddLink();
      },));

    },
    child: Padding(
    padding: const EdgeInsets.only(right: 20, bottom: 80),
    child:  CircleAvatar(
    backgroundColor: kPrimaryColor,
    maxRadius: 30,
    child:Icon(
    Icons.add,
    size: 30,
    color: Colors.white,
    ),
    ),
    ),
    )
    );
  }
}






