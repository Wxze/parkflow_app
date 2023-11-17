class ExternalCustomer {
  final String email;
  final String driverId;
  final String driverName;
  final String driverPhone;

  ExternalCustomer({required this.email, required this.driverId, required this.driverName, required this.driverPhone});

  factory ExternalCustomer.fromJson(Map<String, dynamic> json) {
    return ExternalCustomer(email: json['email'], driverId: json['driver']['id'], driverName: json['driver']['name'], driverPhone: json['driver']['phone']);
  }
}
