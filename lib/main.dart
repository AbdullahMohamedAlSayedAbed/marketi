import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/services/get_it_services.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/widgets/custom_bloc_opserver.dart';
import 'package:marketi/features/cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/favourite/presentation/controller/favorite_cubit/favorite_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  Bloc.observer = CustomBlocObserver();
  runApp(const MarketApp());
}

class MarketApp extends StatelessWidget {
  const MarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CartCubit>()),
        BlocProvider(create: (context) => getIt<FavoriteCubit>()),
      ],
      child: MaterialApp(
        title: 'Market App',
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.splash,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
