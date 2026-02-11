import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              style: TextStyle(color: AppColors.textSecondary, fontSize: isMobile ? 12 : 13),
            ),
            const SizedBox(height: 40),
            if (isMobile) ...[
              _projectCard(
                'FinTrack Mobile',
                'A personal finance tracker built with Flutter and Firebase.',
                ['Flutter', 'Firebase'],
                Icons.smartphone,
                context,
              ),
              const SizedBox(height: 16),
              _projectCard(
                'E-Commerce Kit',
                'An open-source UI kit for e-commerce apps.',
                ['Flutter', 'UI/UX'],
                Icons.shopping_cart,
                context,
              ),
            ] else
              Row(
                children: [
                  Expanded(
                    child: _projectCard(
                      'FinTrack Mobile',
                      'A personal finance tracker built with Flutter and Firebase.',
                      ['Flutter', 'Firebase'],
                      Icons.smartphone,
                      context,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _projectCard(
                      'E-Commerce Kit',
                      'An open-source UI kit for e-commerce apps.',
                      ['Flutter', 'UI/UX'],
                      Icons.shopping_cart,
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

  Widget _projectCard(String title, String desc, List<String> tags, IconData icon, BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 32),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.shadow, blurRadius: 30, offset: const Offset(0, 10))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: AppColors.fieldBackground, borderRadius: BorderRadius.circular(12)),
                child: Icon(icon, color: AppColors.textPrimary, size: isMobile ? 20 : 24),
              ),
              const Icon(Icons.open_in_new, color: AppColors.textTertiary, size: 20),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: isMobile ? 18 : 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: AppColors.textSecondary, fontSize: isMobile ? 14 : 15, height: 1.5),
          ),
          const SizedBox(height: 24),
          const Divider(color: AppColors.borderLight),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags
                .map(
                  (t) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.tagBackground,
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      t,
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textTertiary),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
