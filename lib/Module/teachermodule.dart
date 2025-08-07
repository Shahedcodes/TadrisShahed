class Teacher {
  final String id;
  final String name;
  final String? avatarUrl;
  final int experienceYears;
  final bool isVerified;
  final String locationType;
  final double baseHourlyRate;
  final List<String> subjects;
  final double averageRating;
  final bool IsFemale;

  Teacher({
    required this.id,
    required this.name,
    this.avatarUrl,
    required this.experienceYears,
    required this.isVerified,
    required this.locationType,
    required this.baseHourlyRate,
    required this.subjects,
    required this.averageRating,
    required this.IsFemale,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    final reviews = (json['reviews'] as List<dynamic>?)
            ?.map((r) => (r as Map<String, dynamic>)['rating'] as int)
            .toList() ??
        [];

    final averageRating = reviews.isEmpty
        ? 0.0
        : reviews.reduce((a, b) => a + b) / reviews.length;

    return Teacher(
      id: json['id'],
      name: json['name'] ?? 'غير معروف',
      avatarUrl: json['avatar_url'],
      experienceYears: json['experience_years'] ?? 0,
      isVerified: json['is_verified'] ?? false,
      locationType: json['location_type'] ?? 'online',
      baseHourlyRate: (json['base_hourly_rate'] ?? 0).toDouble(),
      subjects: (json['subjects'] as List<dynamic>?)
              ?.map((s) => s['subjects']['name'].toString())
              .toList() ??
          [],
      averageRating: averageRating,
      IsFemale: json['IsFemale'] ?? false,
    );
  }
}
