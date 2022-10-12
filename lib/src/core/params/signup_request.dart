class SignupRequestParams {
  final String accountName;
  final String mobile;
  final String email;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String firstName;
  final String lastName;
  final String couponId;

  const SignupRequestParams({
    required this.email,
    required this.mobile,
    required this.accountName,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.firstName,
    required this.lastName,
    required this.couponId,
  });
}
