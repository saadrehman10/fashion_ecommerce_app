class CountryCode {
  final String countryName;
  final String countryCode;

  const CountryCode({
    required this.countryName,
    required this.countryCode,
  });

  // Override the == operator to compare based on countryName and countryCode
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CountryCode &&
        other.countryName == countryName &&
        other.countryCode == countryCode;
  }

  // Override hashCode for using this class in collections or DropdownButton
  @override
  int get hashCode => countryName.hashCode ^ countryCode.hashCode;

  // Factory constructor to create an instance from JSON
  factory CountryCode.formJson(Map<String, dynamic> map) {
    return CountryCode(
      countryName: map['code']!,
      countryCode: map['dial_code']!,
    );
  }
}
