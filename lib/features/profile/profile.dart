import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'profile.title',
              style: context.textTheme.headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const ListTile(
              leading: CircleAvatar(),
              title: Text('Name'),
              subtitle: Text('Mail'),
            ),
          ],
        ),
      ),
    );
  }  
}
