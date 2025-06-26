import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fm_template/app/bloc/app_bloc.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Column(
        children: [
          TextButton.icon(
            onPressed: () {
              final appBloc = context.read<AppBloc>();
              appBloc.add(
                UpdateThemeEvent(
                  appBloc.state.themeMode == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light,
                ),
              );
            },
            label: const Text('Change theme'),
            icon: const Icon(Icons.color_lens),
          ),
        ],
      ),
    );
  }
}
