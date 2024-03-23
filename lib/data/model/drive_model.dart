

class TripsModel {
  TripsModel({required this.trips});

  final List<DriveModel> trips;

  factory TripsModel.fromMap(Map<String, dynamic> map) {
    return TripsModel(
      trips: List<DriveModel>.from(
        (map['trips'] as List<dynamic>).map<DriveModel>(
          (x) => DriveModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class DriveModel {
  const DriveModel({
    this.name,
    this.transport,
    this.price,
    this.currency,
    this.departureCity,
    this.departureCityDate,
    this.destinationCity,
    this.destinationCityDate,
  });

  final String? name;
  final String? transport;
  final String? price;
  final String? currency;
  final String? departureCity;
  final String? departureCityDate;
  final String? destinationCity;
  final String? destinationCityDate;

  factory DriveModel.fromMap(Map<String, dynamic> map) {
    return DriveModel(
      name: map['Driver1'] != null ? map['Driver1'] as String : null,
      transport:
          map['Bus']['Model'] != null ? map['Bus']['Model'] as String : null,
      price: map['PassengerFareCostAvibus'] != null
          ? map['PassengerFareCostAvibus'] as String
          : null,
      currency: map['Currency'] != null ? map['Currency'] as String : null,
      departureCity: map['Departure']['Name'] as String,
      departureCityDate: map['DepartureTime'] as String,
      destinationCity: map['Destination']['Name'] as String,
      destinationCityDate: map['ArrivalTime'] as String,
    );
  }
}
