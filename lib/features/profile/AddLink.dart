import 'package:bootcamp_starter/models/link.dart';
import 'package:bootcamp_starter/provider/link_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/custom_labeled_textfield_widget.dart';
import '../../core/widgets/secondary_button_widget.dart';


class AddLink extends StatefulWidget {

   AddLink({super.key});

  @override
  State<AddLink> createState() => _AddLinkState();
}

class _AddLinkState extends State<AddLink> {
  TextEditingController titleController = TextEditingController();
  TextEditingController linkController = TextEditingController();
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        title: const Text('Add Link',style: TextStyle(
          fontSize: 18,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(height: 20),
             PrimaryLabeledTextFieldWidget(label: 'title',
              controller: titleController),
            const SizedBox(height: 20,),
             PrimaryLabeledTextFieldWidget(label: 'link',
              controller: linkController),
            const SizedBox(height: 30,),
            SecondaryButtonWidget(text: 'ADD',
              width: 138,
              onTap: (){
                 // Provider.of<LinkProvider>(context,listen: false).addNewLink(title: titleController.text, link: linkController.text);
                Provider.of<LinkProvider>(context,listen: false).addNewLink(
                  new Link(title: titleController.text , link: linkController.text)
                );
                 Navigator.pop(context);
              },),


          ],
        ),
      ),
    );
  }
}