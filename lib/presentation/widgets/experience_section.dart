import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/responsive.dart';
import '../../core/theme/app_colors.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
              'Experience',
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
              'My professional journey in mobile development',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: isMobile ? 12 : 13,
              ),
            ),
            const SizedBox(height: 40),
            _expCard(
              'Jr. Mobile App Developer',
              'White Label Fox',
              'Jul 2024 — Present',
              [
                'Contributed to the development and customization of 15+ white-label mobile product bundles across delivery, booking, and home services domains.',
                'Built and maintained 12+ projects, participating in the full development lifecycle including UI design, feature development, deployment, and post-launch support.',
                'Developed real-time location tracking, online payments, push notifications, and deep linking features (first-time implementation for select product lines).',
                'Utilized Bloc and Redux for state management, Hive for local storage, building clean and scalable app architectures.',
                'Integrated third-party APIs and SDKs (Google Maps, Firebase, social login) to meet diverse client requirements across multiple regions.',
                'Deployed apps to Play Store and App Store, managing releases, resolving compliance issues, and addressing rejection cases for successful approval.',
                'Collaborated with designers, QA testers, and backend teams to deliver high-quality features and handled legacy app improvements.',
              ],
              [
                'Flutter',
                'Dart',
                'Bloc',
                'Redux',
                'Hive',
                'Firebase',
                'Google Maps',
              ],
              context,
            ),
            const SizedBox(height: 24),
            _expCard(
              'Mobile App Developer Intern',
              'White Label Fox',
              'Nov 2023 — Jun 2024',
              [
                'Assisted in developing white-label mobile applications for various business domains.',
                'Learned and implemented Flutter development best practices under senior developer guidance.',
                'Contributed to feature development, bug fixes, and UI improvements.',
                'Gained hands-on experience with state management, API integration, and app deployment processes.',
              ],
              ['Flutter', 'Dart', 'Firebase'],
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _expCard(
    String title,
    String company,
    String date,
    List<String> bulletPoints,
    List<String> tags,
    BuildContext context,
  ) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 32),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.surface),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isMobile)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: date.contains('Present')
                        ? AppColors.primary
                        : AppColors.borderLight,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    date,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: date.contains('Present')
                          ? AppColors.surface
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: isMobile ? 18 : 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  company,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                    fontSize: isMobile ? 12 : 13,
                  ),
                ),
              ],
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        company,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: date.contains('Present')
                        ? AppColors.primary
                        : AppColors.borderLight,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    date,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: date.contains('Present')
                          ? AppColors.surface
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 24),
          ...bulletPoints.map(
            (bp) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(Icons.circle, size: 4),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      bp,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        height: 1.5,
                        fontSize: isMobile ? 13 : 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(color: AppColors.borderLight),
          const SizedBox(height: 16),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Text(
                'STACK',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textTertiary,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(width: 12),
              ...tags.map(
                (tag) => Container(
                  margin: const EdgeInsets.only(right: 8, bottom: 4),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.tagBackground,
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
