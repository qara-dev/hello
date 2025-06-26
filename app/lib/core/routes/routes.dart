import 'package:auto_route/auto_route.dart';
import 'package:hello/core/routes/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
    // NamedRouteDef(
    //   initial: true,
    //   path: 'profile/',
    //   name: 'ProfileRoute',
    //   builder: (context, data) {
    //     return ProfilePage(id: data.params.getInt('id'));
    //   },
    // ),
    AutoRoute(page: ProfileRoute.page, initial: true),
  ];
}
