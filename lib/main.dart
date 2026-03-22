import 'package:conversation_app/providers/Card_Interation/Cardprovider.dart';
import 'package:conversation_app/providers/Card_Interation/card_provider.dart';
import 'package:conversation_app/providers/DashboardProvider/dashboard_provider.dart';
import 'package:conversation_app/providers/OnboardingProvider/all_set_provider.dart';
import 'package:conversation_app/providers/OnboardingProvider/deck_provider.dart';
import 'package:conversation_app/providers/OnboardingProvider/notification_provider.dart';
import 'package:conversation_app/providers/OnboardingProvider/onboarding_provider.dart';
import 'package:conversation_app/providers/Paywall/plan_provider_subscription.dart';
import 'package:conversation_app/providers/Paywall/question_screen_provider.dart';
import 'package:conversation_app/providers/Paywall/user_type_screen_provider.dart';
import 'package:conversation_app/providers/WhoAreYouProvider/who_are_you.dart';
import 'package:conversation_app/providers/authentication/auth_see_you_screen_provider.dart';
import 'package:conversation_app/providers/library/library_provider.dart';
import 'package:conversation_app/providers/splash_provider/splash_provider.dart';
import 'package:conversation_app/ui/screens/Splash/splash_screen.dart';
import 'package:conversation_app/ui/screens/authentication/wel_come_back_screen.dart';
import 'package:conversation_app/ui/screens/dashboard/dashboard_screen.dart';
import 'package:conversation_app/ui/screens/library/library_screen.dart';
import 'package:conversation_app/ui/screens/savedconversations/saved_conversations_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => DeckProvider()),
        ChangeNotifierProvider(create: (_) => WhoAreYouProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => AllSetProvider()),
        ChangeNotifierProvider(create: (_) => CardProvider()),
        ChangeNotifierProvider(create: (_) => CardFocusScreenProvider(),),
        ChangeNotifierProvider(create: (_) => UserTypeScreenProvider()),
        ChangeNotifierProvider(create: (_) => QuestionScreenProvider()),
        ChangeNotifierProvider(create: (_)=>PricingProviderSubscription()),
        ChangeNotifierProvider(create: (_)=>AuthSeeYouScreenProvider()),
        ChangeNotifierProvider(create: (_)=>LibraryProvider()),
        ChangeNotifierProvider(create: (_)=>DashboardProvider()),
        
      ],
      child: DevicePreview(
        enabled: true, 
        builder: (context) => const MyApp(), 
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const DashBoardScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
