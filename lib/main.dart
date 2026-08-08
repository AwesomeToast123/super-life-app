import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:super_life_app/features/timer/timer_screen.dart';
import 'package:super_life_app/layout/app_shell.dart';
import 'package:super_life_app/providers/expense_provider.dart';
import 'package:super_life_app/providers/timer_provider.dart';

import 'features/expense_tracker/expense_tracker.dart';
import 'features/notes /notes_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/expense_tracker_model.dart';
import 'model/timer_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseTrackerModelAdapter());
  Hive.registerAdapter(TimerModelAdapter());
  await Hive.openBox<ExpenseTrackerModel>('myBox');
  await Hive.openBox<TimerModel>('timerBox');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExpenseProvider()),
        ChangeNotifierProvider(create: (_) => TimerProvider()),
      ],
      child: MyApp(),
    ),
  );
}


final GoRouter _router = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      builder:
          (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
          ) {
            return AppShell(navigationShell: navigationShell);
          },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const TimerScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/notes',
              builder: (context, state) => const NotesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/expense-tracker',
              builder: (context, state) => const ExpenseTracker(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      routerConfig: _router,
    );
  }
}
