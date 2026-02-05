import '../data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static List<Ride> availableRides = fakeRides; // TODO for now fake data

  static List<Ride> filterByDeparture(Location departure) {
    return availableRides
        .where((ride) => ride.departureLocation == departure)
        .toList();
  }

  static List<Ride> filterBySeatRequested(
    List<Ride> rides,
    int requestedSeats,
  ) {
    return availableRides
        .where((ride) => ride.availableSeats >= requestedSeats)
        .toList();
  }

  static List<Ride> filterBy({Location? departure, int? seatRequested}) {
    List<Ride> result = availableRides;

    if (departure != null) {
      result = filterByDeparture(departure);
    }

    if (seatRequested != null) {
      result = filterBySeatRequested(result, seatRequested);
    }
    return result;
  }
}
