import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/features/authentication/domain/entities/app_auth.dart';
import 'package:insta_clone/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:insta_clone/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:insta_clone/features/profile/presentation/pages/edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  const ProfilePage({super.key, required this.uid});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final authCubit = context.read<AuthCubit>();
  late final profileCubit = context.read<ProfileCubit>();

  late AppUser? currentUser = authCubit.currentUser;

  @override
  void initState() {
    super.initState();
    profileCubit.fetchUserProfile(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          final user = state.profileUser;
          return Scaffold(
            appBar: AppBar(
              title: Text(user.name),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    icon: Icon(Icons.edit, color: theme.inversePrimary),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return EditProfilePage(user: user);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      user.email,
                      style: TextStyle(fontSize: 12, color: theme.primary),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 129,
                      width: 120,
                      padding: const EdgeInsets.all(25),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: 72,
                          color: theme.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  //bio
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.secondary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Text(
                      user.bio.isEmpty ? "No bio..." : user.bio,
                      style: TextStyle(color: theme.primary),
                    ),
                  ),

                  // posts
                ],
              ),
            ),
          );
        } else if (state is ProfileLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return const Center(child: Text("No Profile Found"));
        }
      },
    );
  }
}
