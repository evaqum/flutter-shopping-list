import 'package:flutter/widgets.dart';

import '../domain/lists/list.dart';
import '../presentation/edit_list/edit_list_screen.dart';
import '../presentation/intro/intro_screen.dart';
import '../presentation/lists_overview/lists_overview_screen.dart';
import '../presentation/unreachable/unreachable_screen.dart';

abstract class QRouter {
  const QRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Object? arguments = settings.arguments;

    switch (settings.name) {
      // case splashRoute:
      //   return SplashScreen.route();
      case overviewRoute:
        return ListsOverviewScreen.route();
      case introRoute:
        return IntroScreen.route();
      case editListRoute:
        if (arguments is ShoppingList?) {
          return EditListScreen.route(arguments);
        }
        return EditListScreen.route(null);
    }

    return UnreachableScreen.route(settings);
  }

  // static const initialRoute = splashRoute;
  // static const splashRoute = 'splash';
  static const String overviewRoute = 'overview';
  static const String introRoute = 'intro';

  static const String editListRoute = 'editList';
}
