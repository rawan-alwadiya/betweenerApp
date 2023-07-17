import 'package:bootcamp_starter/features/profile/friendProfile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/widgets/custom_text.dart';
import '../../provider/follower_provider.dart';

class FollowerPage extends StatelessWidget {
  const FollowerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Followers'),),
      body: Consumer<FollowerProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            itemCount: provider.FollowersList.data?.length ??0,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 80,
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title:CustomText(text: provider.FollowersList.data?[index]?.name,color:Colors.black,fontWeight: FontWeight.w600,),
                  subtitle: CustomText(text: provider.FollowersList.data?[index]?.email,color:Colors.black,fontSize: 12,),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>FriendProfile(name: provider.FollowersList.data?[index]?.name ?? '',
                            email: provider.FollowersList.data?[index]?.email?? '')
                    )
                    );
                  },

                ),
              );
            },);
        },

      ),
    );
  }
}