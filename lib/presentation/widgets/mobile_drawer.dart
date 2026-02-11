import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/personal_info.dart';
import '../../core/theme/app_colors.dart';

class MobileDrawer extends StatelessWidget {
  final Function(String) onNavTap;
  const MobileDrawer({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              '${PersonalInfo.firstName.toUpperCase()} ${PersonalInfo.lastName.toUpperCase()}',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Divider(color: AppColors.borderLight),
          _drawerItem('About', Icons.person_outline),
          _drawerItem('Stats', Icons.bar_chart),
          _drawerItem('Experience', Icons.work_outline),
          _drawerItem('Projects', Icons.code),
          _drawerItem('Contact', Icons.email_outlined),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              '© ${PersonalInfo.copyrightYear} ${PersonalInfo.fullName}',
              style: GoogleFonts.inter(
                fontSize: 11,
                color: AppColors.textTertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(String title, IconData icon) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      leading: Icon(icon, color: AppColors.textSecondary, size: 20),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      onTap: () => onNavTap(title),
    );
  }
}
