import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/responsive.dart';
import '../../core/theme/app_colors.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = Responsive.screenWidth(context);
    final bool isMobile = Responsive.isMobile(context);

    return Center(
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 800),
        padding: EdgeInsets.symmetric(horizontal: isMobile ? width * 0.05 : 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Skills',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                fontSize: isMobile ? 20 : 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Technologies and tools I work with',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: isMobile ? 12 : 13,
              ),
            ),
            const SizedBox(height: 40),

            // Language
            _skillCategory('Language', ['Dart', 'Java'], context),
            const SizedBox(height: 24),

            // Technologies
            _skillCategory('Technologies', [
              'Flutter',
              'Firebase',
              'REST API Integration',
            ], context),
            const SizedBox(height: 24),

            // State Management & Storage
            _skillCategory('State Management & Storage', [
              'Bloc',
              'Redux',
              'Hive',
            ], context),
            const SizedBox(height: 24),

            // Database
            _skillCategory('Database', [
              'Firebase Firestore',
              'MySQL',
            ], context),
            const SizedBox(height: 24),

            // Tools
            _skillCategory('Tools', [
              'Git',
              'GitHub',
              'Android Studio',
              'VS Code',
              'Postman',
            ], context),
            const SizedBox(height: 24),

            // Other Skills
            _skillCategory('Other Skills', [
              'Deep Linking',
              'Push Notifications',
              'Google Maps',
              'App Deployment',
              'Third-Party SDK Integration',
            ], context),
          ],
        ),
      ),
    );
  }

  Widget _skillCategory(
    String title,
    List<String> skills,
    BuildContext context,
  ) {
    final bool isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: isMobile ? 10 : 11,
            fontWeight: FontWeight.bold,
            color: AppColors.textTertiary,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: skills
              .map(
                (s) => Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 12 : 16,
                    vertical: isMobile ? 8 : 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.fieldBackground,
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    s,
                    style: TextStyle(
                      fontSize: isMobile ? 12 : 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
