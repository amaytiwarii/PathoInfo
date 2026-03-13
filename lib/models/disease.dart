class Disease {
  final String id;
  final String name;
  final String category;
  final String shortDescription;

  final List<String> symptoms;
  final List<String> causes;
  final List<String> diagnosis;
  final List<String> treatment;
  final List<String> prevention;
  final List<String> riskFactors;

  final bool isPopular;
  final bool isCurable;

  Disease({
    required this.id,
    required this.name,
    required this.category,
    required this.shortDescription,
    required this.symptoms,
    required this.causes,
    required this.diagnosis,
    required this.treatment,
    required this.prevention,
    required this.riskFactors,
    this.isPopular = false,
    this.isCurable = true,
  });
}
