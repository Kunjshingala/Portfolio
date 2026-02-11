import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/personal_info.dart';
import '../../core/responsive.dart';
import '../../core/theme/app_colors.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
              'Featured Projects',
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
              'Selected work showcasing Flutter expertise',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: isMobile ? 12 : 13,
              ),
            ),
            const SizedBox(height: 40),
            if (isMobile) ...[
              _projectCard(
                'BMI Calculator',
                'A BMI calculator application (Android/iOS) that calculates Body Mass Index from user input with a clean and intuitive UI for a smooth user experience.',
                ['Flutter', 'Material Design'],
                Icons.calculate,
                PersonalInfo.bmiCalculatorUrl,
                context,
              ),
              const SizedBox(height: 16),
              _projectCard(
                'Weather App',
                'A weather mobile application (Android/iOS) that displays real-time conditions based on city name or user location using OpenWeather One Call API 3.0.',
                ['Flutter', 'Material Design', 'API Integration'],
                Icons.wb_sunny,
                PersonalInfo.weatherAppUrl,
                context,
              ),
            ] else
              Row(
                children: [
                  Expanded(
                    child: _projectCard(
                      'BMI Calculator',
                      'A BMI calculator application (Android/iOS) that calculates Body Mass Index from user input with a clean and intuitive UI for a smooth user experience.',
                      ['Flutter', 'Material Design'],
                      Icons.calculate,
                      PersonalInfo.bmiCalculatorUrl,
                      context,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _projectCard(
                      'Weather App',
                      'A weather mobile application (Android/iOS) that displays real-time conditions based on city name or user location using OpenWeather One Call API 3.0.',
                      ['Flutter', 'Material Design', 'API Integration'],
                      Icons.wb_sunny,
                      PersonalInfo.weatherAppUrl,
                      context,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _projectCard(
    String title,
    String desc,
    List<String> tags,
    IconData icon,
    String url,
    BuildContext context,
  ) {
    return _HoverProjectCard(
      title: title,
      desc: desc,
      tags: tags,
      icon: icon,
      url: url,
    );
  }
}

class _HoverProjectCard extends StatefulWidget {
  final String title;
  final String desc;
  final List<String> tags;
  final IconData icon;
  final String url;

  const _HoverProjectCard({
    required this.title,
    required this.desc,
    required this.tags,
    required this.icon,
    required this.url,
  });

  @override
  State<_HoverProjectCard> createState() => _HoverProjectCardState();
}

class _HoverProjectCardState extends State<_HoverProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

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
          padding: EdgeInsets.all(isMobile ? 24 : 32),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered ? AppColors.primary : AppColors.surface,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered ? AppColors.shadowStrong : AppColors.shadow,
                blurRadius: _isHovered ? 40 : 30,
                offset: Offset(0, _isHovered ? 15 : 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.fieldBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      widget.icon,
                      color: AppColors.textPrimary,
                      size: isMobile ? 20 : 24,
                    ),
                  ),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 200),
                    turns: _isHovered ? 0.125 : 0,
                    child: Icon(
                      Icons.open_in_new,
                      color: _isHovered
                          ? AppColors.primary
                          : AppColors.textTertiary,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                widget.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: isMobile ? 18 : 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.desc,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: isMobile ? 14 : 15,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              const Divider(color: AppColors.borderLight),
              const SizedBox(height: 20),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.tags
                    .map(
                      (t) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.tagBackground,
                          border: Border.all(color: AppColors.border),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          t,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
