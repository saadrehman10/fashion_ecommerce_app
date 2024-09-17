class CountryCode {
  final String countryName;
  final String countryCode;

  const CountryCode({
    required this.countryName,
    required this.countryCode,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CountryCode &&
        other.countryName == countryName &&
        other.countryCode == countryCode;
  }

  @override
  int get hashCode => countryName.hashCode ^ countryCode.hashCode;

  factory CountryCode.formJson(Map<String, dynamic> map) {
    return CountryCode(
      countryName: map['name']!,
      countryCode: map['dial_code']!,
    );
  }
}
