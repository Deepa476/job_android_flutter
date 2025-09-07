import 'package:flutter/material.dart';
import 'package:job/screen/dashboard/home_screen.dart';
import 'package:job/screen/login/forgot_password.dart';
import 'package:job/screen/login/login.dart';
import 'package:job/screen/login/signup.dart';
import 'package:job/screen/splash/onboarding.dart';
import 'package:job/screen/splash/splash_screen.dart';
import 'package:job/screen/applications.dart';
import 'package:job/screen/saved_job.dart';
import 'package:job/screen/profile.dart';
import 'package:job/screen/setting_page.dart';
import 'package:job/screen/job_detail.dart';
import 'package:job/screen/search_jobs.dart' as search_screen;

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';

  static const String shell = '/home';
  static const String home = '/home/feed';
  static const String search = '/home/search';
  static const String saved = '/home/saved';
  static const String applications = '/home/applications';
  static const String profile = '/home/profile';

  static const String jobDetail = '/job-detail';
  static const String settings = '/settings';
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case AppRoutes.onboarding:
      return MaterialPageRoute(builder: (_) => const OnboardingScreen());
    case AppRoutes.login:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case AppRoutes.signup:
      return MaterialPageRoute(builder: (_) => const SignupScreen());
    case AppRoutes.forgotPassword:
      return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
    case AppRoutes.shell:
    case AppRoutes.home:
      return MaterialPageRoute(builder: (_) => const HomeShell(initialIndex: 0));
    case AppRoutes.search:
      return MaterialPageRoute(builder: (_) => const HomeShell(initialIndex: 1));
    case AppRoutes.saved:
      return MaterialPageRoute(builder: (_) => const HomeShell(initialIndex: 2));
    case AppRoutes.applications:
      return MaterialPageRoute(builder: (_) => const HomeShell(initialIndex: 3));
    case AppRoutes.profile:
      return MaterialPageRoute(builder: (_) => const HomeShell(initialIndex: 4));
    case AppRoutes.jobDetail:
      return MaterialPageRoute(builder: (_) => const JobDetailsScreen());
    case AppRoutes.settings:
      return MaterialPageRoute(builder: (_) => SettingsScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Route not found')),
        ),
      );
  }
}

class HomeShell extends StatefulWidget {
  final int initialIndex;
  const HomeShell({super.key, this.initialIndex = 0});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  late int _currentIndex;
  final _navigatorKeys = List.generate(5, (_) => GlobalKey<NavigatorState>());

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTap(int index) {
    if (_currentIndex == index) {
      _navigatorKeys[index].currentState?.popUntil((r) => r.isFirst);
    } else {
      setState(() => _currentIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final canPop = _navigatorKeys[_currentIndex].currentState?.canPop() ?? false;
        if (canPop) {
          _navigatorKeys[_currentIndex].currentState?.pop();
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            _buildTabNavigator(0, const HomeDashboard()),
            _buildTabNavigator(1, const search_screen.SearchJobsScreen()),
            _buildTabNavigator(2, const SavedJobsScreen()),
            _buildTabNavigator(3, const ApplicationsScreen()),
            _buildTabNavigator(4, ProfileScreen()),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
            BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Apps'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildTabNavigator(int index, Widget child) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (_) => child),
    );
  }
}


