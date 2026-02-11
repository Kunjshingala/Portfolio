import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/assets.dart';
import '../../core/constants/personal_info.dart';
import '../../core/theme/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          const Divider(color: AppColors.borderLight),
          const SizedBox(height: 60),
          Image.asset(Assets.logoFavicon, height: 48, fit: BoxFit.contain),
          const SizedBox(height: 16),
          Text(
            '© ${PersonalInfo.copyrightYear} ${PersonalInfo.fullName}. Built with Flutter.',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: AppColors.textTertiary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              if (PersonalInfo.showGithub) ...[
                _footerLink('GitHub', PersonalInfo.githubUrl),
                if (PersonalInfo.showLinkedIn || PersonalInfo.showTwitter)
                  _divider(),
              ],
              if (PersonalInfo.showLinkedIn) ...[
                _footerLink('LinkedIn', PersonalInfo.linkedinUrl),
                if (PersonalInfo.showTwitter) _divider(),
              ],
              if (PersonalInfo.showTwitter)
                _footerLink('Twitter', PersonalInfo.twitterUrl),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String title, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        child: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 4,
      height: 4,
      decoration: const BoxDecoration(
        color: AppColors.border,
        shape: BoxShape.circle,
      ),
    );
  }
}
