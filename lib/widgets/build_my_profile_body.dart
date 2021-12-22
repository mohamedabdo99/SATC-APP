import 'package:flutter/material.dart';
import 'package:satc/Dimension/Dimension.dart';
import 'package:satc/Theme/themes.dart';
import 'package:satc/model/user_model/user_model.dart';
import 'package:satc/modules/edit_profile/edit_profile_screen.dart';
import 'package:satc/shared/components/components.dart';
import 'package:satc/shared/contants/constants.dart';
import 'package:satc/widgets/default_text_button.dart';

class MyProfileBody extends StatelessWidget {
  final UserModel userModel;

  MyProfileBody({required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimension.Size_18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: Dimension.Size_60,
              backgroundImage: NetworkImage(
                '${userModel.image}',
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimension.Size_10,
        ),
        Text(
          '${userModel.name}',
          style: TextStyle(
            color: Themes.Primary,
            fontSize: Dimension.Size_20,
          ),
        ),
        SizedBox(
          height: Dimension.Size_5,
        ),
        Text(
          '${userModel.specialty}',
          style: TextStyle(
            color: Themes.Primary,
            fontSize: Dimension.Size_20,
          ),
        ),
        SizedBox(
          height: Dimension.Size_10,
        ),
        myDivider(),
        Column(
          children: [
            Row(
              children: [
                Text(
                  'Contact Us',
                  style: TextStyle(
                    color: Themes.Primary,
                    fontSize: Dimension.Size_22,
                  ),
                ),
                Spacer(),
                OutlinedButton(
                  onPressed: () {
                    // navigateTo(
                    //   context,
                    //   const EditProfileScreen(),
                    // );
                  },
                  child: Text(
                    'edit',
                    style: TextStyle(
                      color: Themes.Grey,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: Dimension.Size_5,
                ),
              ],
            ),
            SizedBox(
              height: Dimension.Size_10,
            ),
            Row(
              children: [
                Text(
                  'Copy Email : ',
                  style: TextStyle(
                    color: Themes.Primary,
                    fontSize: Dimension.Size_18,
                  ),
                ),
                SelectableText(
                  '${userModel.email}',
                  style: TextStyle(
                    fontSize: Dimension.Size_12,
                  ),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        OutlinedButton(
          onPressed: () {
            signOut(context);
          },
          child: Text(
            'LOG OUT',
            style: TextStyle(
              color: Themes.Red,
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }
}
