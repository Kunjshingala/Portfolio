import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/constants/personal_info.dart';
import 'core/navigation/app_router.dart';
import 'core/theme/app_colors.dart';
import 'presentation/blocs/portfolio/portfolio_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => PortfolioBloc())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: '${PersonalInfo.firstName} Portfolio',
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: AppColors.background,
          primaryColor: AppColors.primary,
          colorScheme: ColorScheme.light(
            primary: AppColors.primary,
            onPrimary: AppColors.surface,
            secondary: AppColors.secondary,
            surface: AppColors.surface,
          ),
          textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
          useMaterial3: true,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
