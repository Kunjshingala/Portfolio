import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:about/core/constants/assets.dart';
import 'package:about/core/constants/info.dart';
import 'package:about/core/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

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
          Image.asset(Assets.logo192, height: 32, fit: BoxFit.contain),
          const SizedBox(height: 16),
          Text(
            '© ${AppInfo.copyrightYear} ${AppInfo.fullName}. Built with Flutter.',
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
              if (AppInfo.showGithub) ...[
                _footerLink('GitHub', AppInfo.githubUrl),
                if (AppInfo.showLinkedIn || AppInfo.showTwitter) _divider(),
              ],
              if (AppInfo.showLinkedIn) ...[
                _footerLink('LinkedIn', AppInfo.linkedinUrl),
                if (AppInfo.showTwitter) _divider(),
              ],
              if (AppInfo.showTwitter) _footerLink('Twitter', AppInfo.twitterUrl),
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
