import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/{{name.snakeCase()}}_bloc.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => {{name.pascalCase()}}Bloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('{{name.titleCase()}} Page')),
        body: const Center(child: Text('Coming Soon...')),
      ),
    );
  }
}
