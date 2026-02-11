import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/glass_navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/stats_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/testimonials_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';
import '../widgets/mobile_drawer.dart';
import '../../core/constants/personal_info.dart';
import '../../core/theme/app_colors.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showLogo = true;

  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _statsKey = GlobalKey();
  final GlobalKey _expKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _testimonialsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      final RenderBox box = context.findRenderObject() as RenderBox;
      final RenderAbstractViewport viewport = RenderAbstractViewport.of(box);

      // Calculate target: reveal offset - navbar height (approx 80px)
      final double target = viewport.getOffsetToReveal(box, 0.0).offset - 80;

      _scrollController.animateTo(
        target < 0 ? 0 : target,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutQuart,
      );
    }
  }

  void _onNavTap(String section) {
    if (_scaffoldKey.currentState?.isEndDrawerOpen ?? false) {
      Navigator.pop(context);
    }

    switch (section) {
      case 'About':
        _scrollToSection(_aboutKey);
        break;
      case 'Stats':
        _scrollToSection(_statsKey);
        break;
      case 'Experience':
        _scrollToSection(_expKey);
        break;
      case 'Skills':
        _scrollToSection(_skillsKey);
        break;
      case 'Projects':
        _scrollToSection(_projectsKey);
        break;
      case 'Testimonials':
        _scrollToSection(_testimonialsKey);
        break;
      case 'Contact':
        _scrollToSection(_contactKey);
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final shouldShowLogo = _scrollController.offset <= 50;
    if (shouldShowLogo != _showLogo) {
      setState(() => _showLogo = shouldShowLogo);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      endDrawer: MobileDrawer(onNavTap: _onNavTap),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(key: _aboutKey),
                const SizedBox(height: 100),
                StatsSection(key: _statsKey),
                const SizedBox(height: 120),
                ExperienceSection(key: _expKey),
                const SizedBox(height: 120),
                SkillsSection(key: _skillsKey),
                const SizedBox(height: 120),
                ProjectsSection(key: _projectsKey),
                if (PersonalInfo.showTestimonials) ...[
                  const SizedBox(height: 120),
                  TestimonialsSection(key: _testimonialsKey),
                ],
                const SizedBox(height: 120),
                ContactSection(key: _contactKey),
                const Footer(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GlassNavbar(
              showLogo: _showLogo,
              onNavTap: _onNavTap,
              onMenuTap: () => _scaffoldKey.currentState?.openEndDrawer(),
            ),
          ),
        ],
      ),
    );
  }
}
