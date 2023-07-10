import 'package:bootcamp_starter/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../core/util/assets.dart';
import '../../../core/util/constants.dart';
import '../../../core/widgets/custom_elevated_button.dart';

class UserCardProfileWidget extends StatelessWidget {


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
                Row(

                  children: [
                    CustomText(
                      text: 'John Doe',
                      color: kScaffoldColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
SizedBox(width: 66,),

                    IconButton(
                        onPressed: () {},
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
                  text: 'Amany@gmail.com',
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
                      text: 'followers 203',
                      onPressed: () {},
                      width: 85,
                        fontSize:12,
                    ),
                    SizedBox(width: 5,),

                    CustomElevatedButton(
                      text: 'following 100',
                      onPressed: () {},
                      width: 85,
                      fontSize:12,
                    ),
                  ],
                )
              ],
            ),



          ],
        ),
      ),
    );
  }
}
