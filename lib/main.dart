import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:about/core/constants/info.dart';
import 'package:about/core/constants/projects.dart';
import 'package:about/core/navigation/app_router.dart';
import 'package:about/core/services/github_service.dart';
import 'package:about/core/theme/app_colors.dart';
import 'package:about/presentation/blocs/projects/projects_bloc.dart';
import 'package:about/presentation/blocs/projects/projects_event.dart';
import 'package:about/presentation/blocs/resume/resume_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ResumeBloc()),
        BlocProvider(
          create: (context) {
            final bloc = ProjectsBloc(
              gitHubService: GitHubService(username: AppInfo.githubUrl.split('/').last),
            );
            if (ProjectConstants.isGitHubDynamic) {
              bloc.add(FetchProjects());
            }
            return bloc;
          },
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppInfo.fullName,
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: AppColors.background,
          primaryColor: AppColors.primary,
          colorScheme: const ColorScheme.light(
            primary: AppColors.primary,
            onPrimary: AppColors.surface,
            secondary: AppColors.secondary,
            surface: AppColors.surface,
          ),
          textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: AppColors.selectionHighlight,
          ),
          useMaterial3: true,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
