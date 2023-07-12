import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/secondary_button_widget.dart';
import '../../models/link.dart';
import '../../provider/link_provider.dart';


class DeleteLink extends StatefulWidget {

   late Link link;

  DeleteLink({super.key , required this.link });

  @override
  State<DeleteLink> createState() => _DeleteLinkState();

}


class _DeleteLinkState extends State<DeleteLink> {
  TextEditingController titleController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xe0da90),
        title: const Text('Delete Link',style: TextStyle(
          fontSize: 18,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('title: '+ widget.link.title! ),
                      SizedBox(height: 10,),
                      Text('url: '+widget.link.link! ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            SecondaryButtonWidget(text: 'DELETE',
              width: 138,
              onTap: (){
                Provider.of<LinkProvider>(context,listen: false).deleteLink(widget.link);
                Navigator.pop(context);
              },),


          ],
        ),
      ),
    );
  }
}