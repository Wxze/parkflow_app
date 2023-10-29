class Vacancy {
  final String id;
  final int number;
  final String sectionId;
  final String sectionName;

  Vacancy(
      {required this.id,
      required this.number,
      required this.sectionId,
      required this.sectionName});

  factory Vacancy.fromJson(Map<String, dynamic> json) {
    return Vacancy(
      id: json['id'],
      number: json['number'],
      sectionId: json['section']['id'],
      sectionName: json['section']['name'],
    );
  }
}
