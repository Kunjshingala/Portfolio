class Experience {
  const Experience({
    required this.title,
    required this.company,
    required this.date,
    required this.bulletPoints,
    required this.tags,
  });

  final String title;
  final String company;
  final String date;
  final List<String> bulletPoints;
  final List<String> tags;
}
