import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_test_app/providers/dark_provider.dart';
import 'package:go_test_app/screens/home_page.dart';
import 'package:go_test_app/screens/login_screen.dart';
import 'package:go_test_app/utils/theme/theme_content.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    var isDark = ref.watch(darkProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeContent.themeDataDark : ThemeContent.themeDataLight,
      home: const LoginScreen(),
      routes: {
        HomePage.routeName: (BuildContext context) => const HomePage(),
      },
    );
  }
}
