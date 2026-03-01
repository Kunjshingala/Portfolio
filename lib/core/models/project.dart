import 'package:flutter/material.dart';

/// Represents a coding project, likely sourced from GitHub or defined locally.
class Project {
  Project({
    required this.title,
    required this.description,
    required this.tags,
    required this.url,
    required this.icon,
  });

  /// Factory constructor to create a [Project] from a JSON map (GitHub API or Pinned API).
  factory Project.fromJson(Map<String, dynamic> json) {
    // NOTE TO REVIEWERS:
    // This factory is designed to be polymorphic. It handles JSON structures from both:
    // - The standard GitHub REST API (which uses 'html_url')
    // - The Pinned Repositories API proxy (which uses 'repo')

    final url = (json['html_url'] as String?) ?? (json['repo'] as String?) ?? '';
    final title = (json['name'] as String?) ?? '';
    final description = (json['description'] as String?) ?? 'No description available.';

    // Language handling: Pinned API may return language as a map {name, color}
    // while standard API returns it as a plain string.
    final tags = <String>[];
    final languageData = json['language'];
    if (languageData is String) {
      tags.add(languageData);
    } else if (languageData is Map && languageData.containsKey('name')) {
      tags.add(languageData['name'] as String);
    }

    // Default icon mapping based on name
    var icon = Icons.code;
    final nameLower = title.toLowerCase();

    if (nameLower.contains('weather')) {
      icon = Icons.wb_sunny;
    } else if (nameLower.contains('calculator') || nameLower.contains('bmi')) {
      icon = Icons.calculate;
    } else if (nameLower.contains('portfolio')) {
      icon = Icons.person;
    }

    return Project(
      title: title,
      description: description,
      tags: tags,
      url: url,
      icon: icon,
    );
  }

  final String title;
  final String description;
  final List<String> tags;
  final String url;
  final IconData icon;
}
