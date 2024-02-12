import 'package:flutter/material.dart';
import 'package:zi_dikr/core/services/storage_service.dart';
import 'package:zi_dikr/src/data/models/dikr_model.dart';
import 'package:zi_dikr/src/presentation/screens/adkar_screen.dart';
import 'package:zi_dikr/src/presentation/screens/dikr_cateory_screen.dart';
import 'package:zi_dikr/src/presentation/screens/splash_screen.dart';

class PageRoutes {
  static Route allGeneratedRoutes(RouteSettings settings) {
    final isFirstOpen = StorageService.getFirstOpen();
    switch (settings.name) {
      case '/':
        if (isFirstOpen) {
          return MaterialPageRoute(
              builder: (context) => const DikrCategoryScreen());
        }
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case '/dikr_categories':
        return MaterialPageRoute(
            builder: (context) => const DikrCategoryScreen());
      case '/adkar':
        return MaterialPageRoute(
          builder: (context) {
            // return AdkarScreen(dikr: dikr);
            DikrArguments params = settings.arguments as DikrArguments;
            return AdkarScreen(adkar: params.adkar, category: params.category);
          },
        );
      default:
        // If there is no such named route, navigate to the home route
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
