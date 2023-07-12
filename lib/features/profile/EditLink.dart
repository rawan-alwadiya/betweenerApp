import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/custom_labeled_textfield_widget.dart';
import '../../core/widgets/secondary_button_widget.dart';
import '../../models/link.dart';
import '../../provider/link_provider.dart';


class EditLink extends StatefulWidget {
  // String title ;
  // String url;
   late int index;
   late Link link;

   EditLink({super.key , required this.index , required this.link});

  @override
  State<EditLink> createState() => _EditLinkState();

}


class _EditLinkState extends State<EditLink> {
  late TextEditingController titleController ;
  late TextEditingController linkController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     titleController = TextEditingController(text: widget.link.title);
     linkController = TextEditingController(text: widget.link.link);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xe0da90),
        title: const Text('Edit Link',style: TextStyle(
          fontSize: 18,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            PrimaryLabeledTextFieldWidget(label: 'title',
              controller: titleController,),
            const SizedBox(height: 20,),
             PrimaryLabeledTextFieldWidget(label: 'link',
             controller: linkController,),
            const SizedBox(height: 30,),
            SecondaryButtonWidget(text: 'UPDATE',
              width: 138,
              onTap: (){
                // Provider.of<LinkProvider>(context,listen: false).updateLink(title: titleController.text, link: linkController.text);
                Provider.of<LinkProvider>(context,listen: false).updateLink(Link(title: titleController.text , link: linkController.text ,id: widget.link.id));
                Navigator.pop(context);
              },),


          ],
        ),
      ),
    );
  }
}