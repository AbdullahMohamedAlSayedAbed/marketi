import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/on_generate_router.dart';

void main() {
  runApp(const MarketApp());
}

class MarketApp extends StatelessWidget {
  const MarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Market App',
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRouter.splash,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        fontFamily: 'Poppins',
      ),
    );
  }
}
