import 'package:flutter/material.dart';
import 'package:job/features/home/home.dart';
import 'package:job/features/auth/auth.dart';
import 'package:job/features/splash/splash_screen.dart' as splash;
import 'package:job/features/profile/profile.dart';
import 'package:job/features/settings/settings.dart';
import 'package:job/features/more/more.dart';

import '../screen/splash/onboarding.dart';
import '../theme/app_theme.dart';

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
  static const String premium = '/premium';
  static const String resumeBuilder = '/resume-builder';
  static const String interviewPrep = '/interview-prep';
  static const String jobAlerts = '/job-alerts';
  static const String chat = '/chat';
  static const String editProfile = '/edit-profile';
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return MaterialPageRoute(builder: (_) => const splash.SplashScreen());
    case AppRoutes.onboarding:
      return MaterialPageRoute(builder: (_) => OnboardingScreen());
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
    // case AppRoutes.premium:
    //   return MaterialPageRoute(builder: (_) => PremiumScreen());
    // case AppRoutes.resumeBuilder:
    //   return MaterialPageRoute(builder: (_) => const ResumeBuilder());
    case AppRoutes.interviewPrep:
      return MaterialPageRoute(builder: (_) => const InterviewPrepScreen());
    // case AppRoutes.jobAlerts:
    //   return MaterialPageRoute(builder: (_) => const JobAlertScreen());
    case AppRoutes.chat:
      return MaterialPageRoute(builder: (_) => const ChatScreen());
    case AppRoutes.editProfile:
      return MaterialPageRoute(builder: (_) => EditProfileScreen());
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: AppTheme.primaryColor),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 22)),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('Edit Profile'),
                onTap: () => Navigator.pushNamed(context, AppRoutes.editProfile),
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium_outlined),
                title: const Text('Premium'),
                onTap: () => Navigator.pushNamed(context, AppRoutes.premium),
              ),
              ListTile(
                leading: const Icon(Icons.description_outlined),
                title: const Text('Resume Builder'),
                onTap: () => Navigator.pushNamed(context, AppRoutes.resumeBuilder),
              ),
              ListTile(
                leading: const Icon(Icons.chat_bubble_outline),
                title: const Text('Chat'),
                onTap: () => Navigator.pushNamed(context, AppRoutes.chat),
              ),
              ListTile(
                leading: const Icon(Icons.notifications_none),
                title: const Text('Job Alerts'),
                onTap: () => Navigator.pushNamed(context, AppRoutes.jobAlerts),
              ),
              ListTile(
                leading: const Icon(Icons.settings_outlined),
                title: const Text('Settings'),
                onTap: () => Navigator.pushNamed(context, AppRoutes.settings),
              ),
            ],
          ),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: [
            _buildTabNavigator(0, HomeDashboard()),
            // _buildTabNavigator(1, search_screen.SearchJobsScreen()),
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


