import 'package:flutter/material.dart';

import '../../core/util/assets.dart';
import '../../core/util/constants.dart';
import '../../core/widgets/custom_labeled_textfield_widget.dart';
import '../../core/widgets/secondary_button_widget.dart';
import '../auth/login_view.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  static String id = '/EditView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightPrimaryColor,
        title: const Text(
          'Edit User Info',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
        child: Column(
          children: [
            SizedBox(height: 20,),
            const CircleAvatar(
              backgroundImage: AssetImage(AssetsData.user),
              radius: 80,
            ),
            const SizedBox(
              height:23,
            ),
            const PrimaryLabeledTextFieldWidget(
              label: 'name',
              hint: 'Dina Almasri',
            ),
            const SizedBox(
              height: 15,
            ),
            const PrimaryLabeledTextFieldWidget(
              label: 'email',
              hint: '123@gmail.com',
            ),
            const SizedBox(
              height: 15,
            ),
            const PrimaryLabeledTextFieldWidget(
              label: 'phone',
              hint: '1234567',
            ),
            const SizedBox(
              height: 40,
            ),
            SecondaryButtonWidget(
              text: 'SAVE',
              width: 135,
              onTap: () {
                Navigator.pushNamed(context, LoginView.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
