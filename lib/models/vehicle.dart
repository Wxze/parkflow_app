class Vehicle {
  final String id;
  final String licensePlate;
  final String brand;
  final String model;
  final String color;
  final String vehicleType;

  Vehicle(this.id, this.licensePlate, this.brand, this.model, this.color,
      this.vehicleType);

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      json['id'],
      json['license_plate'],
      json['brand'],
      json['model'],
      json['color'],
      json['vehicle_type'],
    );
  }
}
