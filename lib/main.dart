import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zi_dikr/core/routes/page_routes.dart';
import 'package:zi_dikr/core/services/storage_service.dart';
import 'package:zi_dikr/src/presentation/cubit/dikr_cubit.dart';
import 'package:zi_dikr/src/presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DikrCubit()..loadAdkar(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: PageRoutes.allGeneratedRoutes,
      ),
    );
  }
}
