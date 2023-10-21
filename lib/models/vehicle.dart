class Vehicle {
  final String id;
  final String licensePlate;
  final String brand;
  final String model;
  final String color;
  final String vehicleType;

  Vehicle(
      {this.id = '',
      required this.licensePlate,
      required this.brand,
      required this.model,
      required this.color,
      required this.vehicleType});

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'],
      licensePlate: json['license_plate'],
      brand: json['brand'],
      model: json['model'],
      color: json['color'],
      vehicleType: json['vehicle_type'],
    );
  }
}
