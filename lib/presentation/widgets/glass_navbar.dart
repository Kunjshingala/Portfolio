import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/assets.dart';
import '../../core/constants/personal_info.dart';
import '../../core/responsive.dart';
import '../../core/theme/app_colors.dart';

class GlassNavbar extends StatelessWidget {
  final Function(String) onNavTap;
  final VoidCallback onMenuTap;
  final bool showLogo;

  const GlassNavbar({
    super.key,
    required this.onNavTap,
    required this.onMenuTap,
    this.showLogo = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      decoration: BoxDecoration(color: AppColors.navBackground),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 24,
            vertical: isMobile ? 12 : 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => onNavTap('About'),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showLogo) ...[
                      Image.asset(
                        Assets.logoFavicon,
                        height: isMobile ? 24 : 28,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: isMobile ? 6 : 8),
                    ],
                    Text(
                      PersonalInfo.fullName,
                      style: GoogleFonts.inter(
                        fontSize: isMobile ? 12 : 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMobile)
                Row(
                  children: [
                    _navItem('About'),
                    const SizedBox(width: 24),
                    _navItem('Stats'),
                    const SizedBox(width: 24),
                    _navItem('Experience'),
                    const SizedBox(width: 24),
                    _navItem('Projects'),
                    const SizedBox(width: 24),
                    _navItem('Contact'),
                  ],
                )
              else
                IconButton(
                  icon: const Icon(Icons.menu),
                  color: AppColors.primary,
                  iconSize: 20,
                  onPressed: onMenuTap,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String title) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onNavTap(title),
        child: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
