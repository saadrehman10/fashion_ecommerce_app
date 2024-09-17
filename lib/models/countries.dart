class CountryCode {
  final String countryName;
  final String countryCode;
  const CountryCode({
    required this.countryName,
    required this.countryCode,
  });

  factory CountryCode.formJson() {
    return CountryCode(countryName: 'hellow', countryCode: 'hello');
  }
}
