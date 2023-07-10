import 'package:flutter/material.dart';
import 'package:project_ebs_wms/provider/auth_provider.dart';
import 'package:project_ebs_wms/provider/sidemenu_provider.dart';
import 'package:project_ebs_wms/router/router.dart';
import 'package:project_ebs_wms/services/local_storage.dart';
import 'package:project_ebs_wms/services/navigation_service.dart';
import 'package:project_ebs_wms/services/notifications_service.dart';
import 'package:project_ebs_wms/ui/layouts/auth/auth_layout.dart';
import 'package:project_ebs_wms/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:project_ebs_wms/ui/layouts/splash/splash_layout.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

void main() async {
  await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideMenuProvider())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      /* localizationsDelegates: const [
        SfGlobalLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ], */
      // locale: const Locale('es', 'ES'),
      //supportedLocales: const [Locale('en', 'US'), Locale('es', 'ES')],
      scaffoldMessengerKey: NotificationsService.messengerKey,
      builder: (_, child) {
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking) {
          return const SplashLayout();
        }

        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }
      },
      theme: ThemeData.light().copyWith(
          scrollbarTheme: const ScrollbarThemeData().copyWith(
              thumbColor:
                  MaterialStateProperty.all(Colors.grey.withOpacity(0.5)))),
    );
  }
}
