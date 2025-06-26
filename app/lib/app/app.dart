import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello/core/di/injection.dart';
import 'package:hello/core/localization/generated/app_localization.dart';
import 'package:hello/core/routes/routes.dart';
import 'package:hello/features/profile/presentation/bloc/profile_bloc.dart';

import 'bloc/app_bloc.dart';

final appRoute = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AppBloc>()),
        BlocProvider(create: (_) => getIt<ProfileBloc>()),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        buildWhen: (p, c) => p.themeMode != c.themeMode || p.locale != c.locale,
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Example app',
            routerConfig: appRoute.config(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.locale,
            themeMode: state.themeMode,
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
