
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../core/util/constants.dart';
import '../../core/widgets/custom_text.dart';
import '../../models/link.dart';
import 'EditLink.dart';
import 'delete_link.dart';

class SlidableSocial extends StatelessWidget {
   late int index ;
   late Link link;

  SlidableSocial({required this.index , required this.link});

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
              onPressed: (context) {
                Navigator.push(context,MaterialPageRoute(builder: (context) {
                  return EditLink(index: index , link: link);
                },));
              },
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
              onPressed: (context) {
                // Provider.of<LinkProvider>(context).deleteLink(id: 75);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // return DeleteLink(title: title, link: link, id: 74);
                   return DeleteLink(link: link,);
                },)
                );
              })
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        height: 70,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(bottom: 24,),
        decoration: BoxDecoration(
          color: index! % 2 == 0 ? Color(0xFFFEE2E7) : Color(0xFFE7E5F1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: link.title,
              color: index % 2 == 0 ? kOnLightDangerColor : kPrimaryColor,
            ),
            SizedBox(
              height: 4,
            ),
            CustomText(
              text: link.link,
              color: index % 2 == 0 ? kOnLightDangerColor : kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
