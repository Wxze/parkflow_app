class Vehicle {
  final String licensePlate;
  final String brand;
  final String model;
  final String color;
  final int vehicleType;

  Vehicle(
      this.licensePlate, this.brand, this.model, this.color, this.vehicleType);

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      json['license_plate'],
      json['brand'],
      json['model'],
      json['color'],
      json['vehicle_type'],
    );
  }
}
