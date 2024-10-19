import 'package:eng_aap/main.dart';
import 'package:eng_aap/screen/a1_screen.dart';
import 'package:eng_aap/screen/b1_screen.dart';
import 'package:eng_aap/screen/b2_screen.dart';
import 'package:eng_aap/screen/dashboard.dart';
import 'package:eng_aap/screen/words_page.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: '/dashboard',
  routes: [
    GoRoute(
      path: '/words_page',
      builder: (context, state) => WordsPage(),
    ),
    GoRoute(
      path: '/a1words_page',
      builder: (context, state) => A1WordsPage(),
    ),
    GoRoute(
      path: '/b1words_page',
      builder: (context, state) => B1WordsPage(),
    ),
    GoRoute(
      path: '/b2words_page',
      builder: (context, state) => B2WordsPage(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => MyHomePage(
        title: '',
      ),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => Dashboard(),
    )
  ],
);
