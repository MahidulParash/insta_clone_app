import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/features/authentication/presentation/components/text_field.dart';
import 'package:insta_clone/features/profile/domain/entities/profile_user.dart';
import 'package:insta_clone/features/profile/presentation/cubits/profile_cubit.dart';

class EditProfilePage extends StatefulWidget {
  final ProfileUser user;
  const EditProfilePage({super.key, required this.user});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController bioController = TextEditingController();
  final bioKey = GlobalKey<FormState>();

  // update profile
  void updateProfile() async {
    final profileCubit = context.read<ProfileCubit>();

    if (bioController.text.isNotEmpty) {
      profileCubit.updateProfile(
        uid: widget.user.uid,
        newBio: bioController.text,
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Bio is empty")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      builder: (context, state) {
        // loading
        // error
        //edit form
        return buildEditPage();
      },
      listener: (context, state) {},
    );
  }

  Widget buildEditPage({double updateProgress = 0.0}) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        centerTitle: true,
        foregroundColor: theme.inversePrimary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.save_alt)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(" Edit Bio"),
            const SizedBox(height: 4),
            CustomTextField(controller: bioController, formKey: GlobalKey()),
          ],
        ),
      ),
    );
  }
}
