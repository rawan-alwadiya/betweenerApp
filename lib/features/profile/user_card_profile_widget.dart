import 'package:bootcamp_starter/core/widgets/custom_text.dart';
import 'package:bootcamp_starter/features/profile/followers.dart';
import 'package:bootcamp_starter/features/profile/following.dart';
import 'package:bootcamp_starter/models/followers_model.dart';
import 'package:bootcamp_starter/provider/follower_provider.dart';
import 'package:bootcamp_starter/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/util/assets.dart';
import '../../core/util/constants.dart';
import '../../core/widgets/custom_elevated_button.dart';
import 'edit_profile.dart';

class UserCardProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FollowerProvider>(
      builder: (context, followerProvider, child) {
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
                          'followings ${followerProvider.FollowingList.data?.length.toString() ?? '0'}',
                          onPressed: () {
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
                          'followers ${followerProvider.FollowersList.data?.length.toString()?? "0"}',
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


