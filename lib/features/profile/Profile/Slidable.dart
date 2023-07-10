import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../core/util/constants.dart';
import '../../../core/widgets/custom_text.dart';

class SlidableSocial extends StatelessWidget {
  int index = 0;

  SlidableSocial(this.index);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: BehindMotion(),
        children: [
          Container(
            width:  70,
           height:  70,


            margin: EdgeInsets.only(bottom: 24,left: 14,right: 14),
            child: SlidableAction(

              backgroundColor: Colors.green,
              icon: Icons.edit,
              onPressed: (context) {},
              borderRadius: BorderRadius.circular(12),

            ),
          ),
          Container(
            width:  70,
           height: 70,
            margin: EdgeInsets.only(bottom: 24,),
            child: SlidableAction(

              backgroundColor: Colors.red,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
              onPressed: (context) {},
            ),
          )
        ],
      ),
      child: Container(
        width: double.infinity,
        height: 70,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(bottom: 24,),
        decoration: BoxDecoration(
          color: index % 2 == 0 ? Color(0xFFFEE2E7) : Color(0xFFE7E5F1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Instagram',
              color: index % 2 == 0 ? kOnLightDangerColor : kPrimaryColor,
            ),
            SizedBox(
              height: 4,
            ),
            CustomText(
              text: 'https://www.instagram.com/a7medhq/',
              color: index % 2 == 0 ? kOnLightDangerColor : kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
