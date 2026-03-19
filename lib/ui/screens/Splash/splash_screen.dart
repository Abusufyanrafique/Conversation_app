import 'package:conversation_app/Utils/app_colors.dart';
import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/providers/splash_provider/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<SplashProvider>(context, listen: false)
          .startSplash(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(                          
      backgroundColor:AppColors.backgroundscreencolor,
      body: Center(
        child: Image(
          image: const AssetImage(
            AppImages.splashLogo
          ),
        ),
      ),
    );
  }
}