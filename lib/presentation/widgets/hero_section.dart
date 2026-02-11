import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/personal_info.dart';
import '../../core/responsive.dart';
import '../../core/theme/app_colors.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = Responsive.screenWidth(context);
    final bool isMobile = Responsive.isMobile(context);

    double headerSize = width * 0.08;
    if (headerSize > 48) headerSize = 48;
    if (headerSize < 28) headerSize = 28;

    return Center(
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 800),
        padding: EdgeInsets.symmetric(horizontal: isMobile ? width * 0.05 : 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: (width * 0.1 > 100 ? 100 : width * 0.1) + 80),

            // "Hi, I'm" text
            RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  fontSize: headerSize,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textPrimary,
                  height: 1.3,
                ),
                children: [
                  const TextSpan(text: 'Hi, I\'m '),
                  TextSpan(
                    text: PersonalInfo.firstName,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.textPrimary,
                      decorationThickness: 2,
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2),

            const SizedBox(height: 16),

            // Role
            Text(
              'Flutter Developer',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                fontSize: isMobile ? 18 : 20,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ).animate().fadeIn(duration: 800.ms, delay: 200.ms),

            const SizedBox(height: 24),

            // Bio
            Text(
              'I design, develop, and ship delightful digital experiences for web and mobile. '
              'Specializing in architecting robust, high-performance applications with Flutter and modern web technologies.',
              style: GoogleFonts.inter(
                fontSize: isMobile ? 14 : 16,
                color: AppColors.textSecondary,
                height: 1.7,
              ),
            ).animate().fadeIn(duration: 800.ms, delay: 400.ms),

            const SizedBox(height: 40),

            // Action buttons
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: [
                _ctaButton('Download CV', true, context: context),
                _ctaButton('Contact Me', false, context: context),
              ],
            ).animate().fadeIn(duration: 800.ms, delay: 600.ms),

            const SizedBox(height: 40),

            // Social icons
            Row(
              children: [
                _socialIcon(FontAwesomeIcons.github, PersonalInfo.githubUrl),
                const SizedBox(width: 24),
                _socialIcon(
                  FontAwesomeIcons.linkedin,
                  PersonalInfo.linkedinUrl,
                ),
                const SizedBox(width: 24),
                _socialIcon(FontAwesomeIcons.xTwitter, PersonalInfo.twitterUrl),
                const SizedBox(width: 24),
                _socialIcon(
                  FontAwesomeIcons.envelope,
                  PersonalInfo.emailAddress,
                ),
              ],
            ).animate().fadeIn(duration: 800.ms, delay: 800.ms),
          ],
        ),
      ),
    );
  }

  Widget _ctaButton(
    String title,
    bool isPrimary, {
    required BuildContext context,
  }) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 32,
        vertical: isMobile ? 12 : 14,
      ),
      decoration: BoxDecoration(
        color: isPrimary ? AppColors.primary : AppColors.surface,
        border: isPrimary ? null : Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(100),
        boxShadow: isPrimary
            ? [
                BoxShadow(
                  color: AppColors.shadowStrong,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: isMobile ? 13 : 14,
          fontWeight: FontWeight.w600,
          color: isPrimary ? AppColors.surface : AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon, String url) {
    return _HoverSocialIcon(icon: icon, url: url);
  }
}

class _HoverSocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;

  const _HoverSocialIcon({required this.icon, required this.url});

  @override
  State<_HoverSocialIcon> createState() => _HoverSocialIconState();
}

class _HoverSocialIconState extends State<_HoverSocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(_isHovered ? 1.2 : 1.0),
          child: Icon(
            widget.icon,
            color: _isHovered ? AppColors.primary : AppColors.textTertiary,
            size: 24,
          ),
        ),
      ),
    );
  }
}
