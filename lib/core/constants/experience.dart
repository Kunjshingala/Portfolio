import 'package:about/core/models/experience.dart';

class ExperienceInfo {
  ExperienceInfo._();

  static const List<Experience> experiences = [
    Experience(
      title: 'Jr. Mobile App Developer',
      company: 'White Label Fox',
      date: 'Jul 2024 — Present',
      bulletPoints: [
        'Contributed to the development and customization of 15+ white-label mobile product bundles across delivery, booking, and home services domains.',
        'Built and maintained 12+ projects, participating in the full development lifecycle including UI design, feature development, deployment, and post-launch support.',
        'Developed real-time location tracking, online payments, push notifications, and deep linking features (first-time implementation for select product lines).',
        'Utilized Bloc and Redux for state management, Hive for local storage, building clean and scalable app architectures.',
        'Integrated third-party APIs and SDKs (Google Maps, Firebase, social login) to meet diverse client requirements across multiple regions.',
        'Deployed apps to Play Store and App Store, managing releases, resolving compliance issues, and addressing rejection cases for successful approval.',
        'Collaborated with designers, QA testers, and backend teams to deliver high-quality features and handled legacy app improvements.',
      ],
      tags: [
        'Flutter',
        'Dart',
        'Bloc',
        'Redux',
        'Hive',
        'Firebase',
        'Google Maps',
      ],
    ),
    Experience(
      title: 'Mobile App Developer Intern',
      company: 'White Label Fox',
      date: 'Nov 2023 — Jun 2024',
      bulletPoints: [
        'Assisted in developing white-label mobile applications for various business domains.',
        'Learned and implemented Flutter development best practices under senior developer guidance.',
        'Contributed to feature development, bug fixes, and UI improvements.',
        'Gained hands-on experience with state management, API integration, and app deployment processes.',
      ],
      tags: ['Flutter', 'Dart', 'Firebase'],
    ),
  ];
}
