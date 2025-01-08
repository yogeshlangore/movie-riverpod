import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_riverpod/presentation/screens/splash_screen.dart';
import 'package:movie_riverpod/providers/theme_provider.dart';
import 'package:movie_riverpod/repo/hive_repo.dart';
import 'package:movie_riverpod/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  HiveRepo().registerAdapter();
  runApp(const ProviderScope(child: MovieApp()));
}

class MovieApp extends ConsumerWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDark = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: AppTheme.themeData(isDark: isDark),
    );
  }
}
