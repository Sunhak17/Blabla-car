import 'package:blabla/model/ride/ride.dart';

import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/services/rides_service.dart';

void main() {
  Location dijon = Location(country: Country.france, name: "Dijon");

  List<Ride> filteredRide = RidesService.filter(
    requestedSeats: 2,
    departureLocation: dijon,
  );

  for (Ride ride in filteredRide) {
    print(ride);
  }
}
