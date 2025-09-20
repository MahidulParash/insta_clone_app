import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_clone/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:insta_clone/features/home/presentation/components/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  signOut() {
    final authCubit = context.read<AuthCubit>();
    authCubit.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
        actions: [
          //signOut
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout)),
        ],
      ),
      drawer: CustomDrawer(),
      body: Center(child: Text("Home")),
    );
  }
}
