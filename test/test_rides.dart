import 'package:week_3_blabla_project/model/ride/ride.dart';

import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/services/rides_service.dart';

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
