import 'package:flutter/material.dart';

import '../../../core/widgets/custom_labeled_textfield_widget.dart';
import '../../../core/widgets/secondary_button_widget.dart';

class AddLink extends StatelessWidget {
  const AddLink({super.key});

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
            const PrimaryLabeledTextFieldWidget(label: 'title',),
            const SizedBox(height: 20,),
            const PrimaryLabeledTextFieldWidget(label: 'link',),
            const SizedBox(height: 30,),
            SecondaryButtonWidget(text: 'SAVE',
              width: 138,
              onTap: (){},),


          ],
        ),
      ),
    );
  }
}