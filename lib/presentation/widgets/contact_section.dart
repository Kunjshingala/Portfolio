import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/personal_info.dart';
import '../../core/responsive.dart';
import '../../core/theme/app_colors.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      _showSnackBar('Please fill in all fields');
      return;
    }

    // Construct mailto URL
    final subject = Uri.encodeComponent('Portfolio Contact: $name');
    final body = Uri.encodeComponent(
      'Name: $name\nEmail: $email\n\nMessage:\n$message',
    );
    final mailtoUrl =
        'mailto:${PersonalInfo.email}?subject=$subject&body=$body';

    final uri = Uri.parse(mailtoUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
      // Clear form after successful launch
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
      _showSnackBar('Opening email client...');
    } else {
      _showSnackBar('Could not open email client');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

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
              'Get in Touch',
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
              'Have a project in mind?',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: isMobile ? 12 : 13,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(isMobile ? 24 : 40),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "I'm currently available for freelance work or full-time opportunities.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: isMobile ? 14 : 15,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 40),
                  if (isMobile) ...[
                    _field('Name', 'Jane Doe', _nameController, context),
                    const SizedBox(height: 20),
                    _field(
                      'Email',
                      'jane@example.com',
                      _emailController,
                      context,
                    ),
                  ] else
                    Row(
                      children: [
                        Expanded(
                          child: _field(
                            'Name',
                            'Jane Doe',
                            _nameController,
                            context,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _field(
                            'Email',
                            'jane@example.com',
                            _emailController,
                            context,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 20),
                  _field(
                    'Message',
                    'Tell me about your project...',
                    _messageController,
                    context,
                    maxLines: 4,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: _sendEmail,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'SEND MESSAGE',
                        style: TextStyle(
                          fontSize: isMobile ? 11 : 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(
    String label,
    String hint,
    TextEditingController controller,
    BuildContext context, {
    int maxLines = 1,
  }) {
    final bool isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: isMobile ? 9 : 10,
            fontWeight: FontWeight.bold,
            color: AppColors.textTertiary,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColors.textTertiary,
              fontSize: isMobile ? 13 : 14,
            ),
            filled: true,
            fillColor: AppColors.fieldBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}
