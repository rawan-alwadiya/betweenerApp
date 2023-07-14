import 'package:bootcamp_starter/core/widgets/custom_text.dart';
import 'package:bootcamp_starter/features/profile/follwer/provider/follwer_provider.dart';
import 'package:bootcamp_starter/prefs/shared_pref_controller.dart';
import 'package:bootcamp_starter/testing_secreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/util/assets.dart';
import '../../core/util/constants.dart';
import '../../core/widgets/custom_elevated_button.dart';
import 'edit_profile.dart';

class UserCardProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FollwerProvider>(
      builder: (context, follwerProvider, child) {
        return  Container(
          // height: 126,
          // width: 350,

          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  maxRadius: 55,
                  backgroundImage: AssetImage(AssetsData.user),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: SharedPreController().getValueFor<String>(
                              key: Prefkeys.name.name) ??
                              '',
                          color: kScaffoldColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          width: 66,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, EditProfile.id);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    CustomText(
                      text: SharedPreController().getValueFor<String>(
                          key: Prefkeys.email.name) ??
                          '',
                      color: kScaffoldColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    CustomText(
                      text: '+9700000000',
                      color: kScaffoldColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        CustomElevatedButton(
                          text:
                          'following ${follwerProvider.FollowingList.data?.length.toString()?? "false"}',
                          onPressed: () {
                            // Provider.of<FollwerProvider>(context,listen: false).fetchtFollowing();
                            // print('followers${Provider.of<FollwerProvider>(context,listen: false).follwerResponse?.followersCount ?? 0}');
                            // print('followers${Provider.of<FollwerProvider>(context,listen: false).follwerResponse?.followingCount ?? 0}');
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return FollowingPage();
                            },));

                          },
                          width: 85,
                          fontSize: 12,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CustomElevatedButton(
                          text:
                          'follower ${follwerProvider.FollowersList.data?.length.toString()?? "false"}',
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return FollowerPage();
                            },));
                          },
                          width: 85,
                          fontSize: 12,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
class FollowerPage extends StatelessWidget {
  const FollowerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Following'),),
      body: Consumer<FollwerProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            itemCount: provider.FollowingList.data?.length ??0,
            itemBuilder: (context, index) {

            return Container(
              width: double.infinity,
              height: 80,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: provider.FollowingList.data?[index].name,color:Colors.black,),
                  SizedBox(height: 4,),
                  CustomText(text: 'https://www.instagram.com/a7medhq/',color: Colors.black,),
                ],
              ),
            );
          },);
        },

      ),
    );
  }
}

class FollowingPage extends StatelessWidget {
  const FollowingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Followers'),),
      body: Consumer<FollwerProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            itemCount: provider.FollowersList.data?.length ??0,
            itemBuilder: (context, index) {

              return Container(
                width: double.infinity,
                height: 80,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: provider.FollowingList.data?[index].name,color:Colors.black,),
                    SizedBox(height: 4,),
                    CustomText(text: 'https://www.instagram.com/a7medhq/',color: Colors.black,),
                  ],
                ),
              );
            },);
        },

      ),
    );
  }
}