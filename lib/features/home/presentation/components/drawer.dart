import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:insta_clone/features/home/presentation/components/drawer_tile.dart';
import 'package:insta_clone/features/profile/presentation/pages/profile_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Divider(color: Theme.of(context).colorScheme.secondary),
            // home tile
            DrawerTile(
              title: "H O M E",
              icon: Icons.home,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            // profile tile
            DrawerTile(
              title: "P R O F I L E",
              icon: Icons.person_4,
              onTap: () {
                Navigator.of(context).pop();
                // get current udi
                final user = context.read<AuthCubit>().currentUser;
                String? uid = user!.uid;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfilePage(uid: uid);
                    },
                  ),
                );
              },
            ),
            // search tile
            DrawerTile(title: "S E A R C H", icon: Icons.search, onTap: () {}),
            // settings tile
            DrawerTile(
              title: "S E T T I N G S",
              icon: Icons.settings,
              onTap: () {},
            ),
            // logout
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: DrawerTile(
                title: "L O G  O U T",
                icon: Icons.logout,
                onTap: () {
                  final authCubit = context.read<AuthCubit>();
                  authCubit.signOut();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
