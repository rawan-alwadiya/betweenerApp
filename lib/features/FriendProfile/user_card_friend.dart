import 'package:flutter/material.dart';

import '../../core/util/assets.dart';
import '../../core/util/constants.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_text.dart';

class UserCardFriend extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 126,
      // width: 350,

      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
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
                  text: 'John Doe',
                  color: kScaffoldColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 8,
                ),
                CustomText(
                  text: 'Amany@gmail.com',
                  color: kScaffoldColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 16,
                ),

                CustomElevatedButton(
                  text: 'Follow',
                  onPressed: () {},
                  width: 90,
                  fontSize:14,
                )
              ],
            ),



          ],
        ),
      ),
    );
  }
}
