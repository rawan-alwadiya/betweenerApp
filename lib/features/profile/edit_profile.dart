import 'package:flutter/material.dart';

import '../../../../bootcamp_starter/lib/core/widgets/custom_labeled_textfield_widget.dart';
import '../../../../bootcamp_starter/lib/core/widgets/secondary_button_widget.dart';
import '../../../../bootcamp_starter/lib/features/auth/login_view.dart';
class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Edit User Info',style: TextStyle(
          fontSize: 18,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20,left: 50,right: 50),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage('https://icons-for-free.com/iconfiles/png/512/customer+information+personal+profile+user+icon-1320086045331670685.png'
              ),
              radius: 50,
            ),
            const SizedBox(height: 10,),
            const PrimaryLabeledTextFieldWidget(label: 'name',hint: 'Dina Almasri',),
            const SizedBox(height: 5,),
            const PrimaryLabeledTextFieldWidget(label: 'email',hint: '123@gmail.com',),
            const SizedBox(height: 5,),
            const PrimaryLabeledTextFieldWidget(label: 'phone',hint: '1234567',),
            const SizedBox(height: 15,),
            SecondaryButtonWidget(text: 'SAVE',
            width: 135,
            onTap: (){
              Navigator.pushNamed(context, LoginView.id);
            },)

          ],
        ),
      ),
    );
  }
}
