import '../data/dummy_data.dart';
import '../model/ride_pref/ride_pref.dart';

////
///   This service handles:
///   - History of the last ride preferences        (to allow users to re-use their last preferences)
///   - Curent selected ride preferences.
///
class RidePrefsService {
  static RidePref? selectedRidePref; // The current selected ride preference

  static List<RidePref> ridePrefsHistory = fakeRidePrefs;
}
