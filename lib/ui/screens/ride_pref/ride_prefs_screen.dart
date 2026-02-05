import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/services/ride_prefs_service.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import 'widgets/ride_prefs_form.dart';
import 'widgets/ride_prefs_tile.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class RidePrefsScreen extends StatelessWidget {
  const RidePrefsScreen({super.key});

  void onRidePrefSelected(RidePref ridePref) {
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_buildBackground(), _buildForeground()]);
  }

  Widget _buildForeground() {
    return Column(
      children: [
        // 1 - THE HEADER
        SizedBox(height: 16),
        Align(
          alignment: AlignmentGeometry.center,
          child: Text(
            "Your pick of rides at low price",
            style: BlaTextStyles.heading.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(height: 100),

        Container(
          margin: EdgeInsets.symmetric(horizontal: BlaSpacings.xxl),
          decoration: BoxDecoration(
            color: Colors.white, // White background
            borderRadius: BorderRadius.circular(16), // Rounded corners
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 2 - THE FORM
              RidePrefForm(initRidePref: RidePrefsService.selectedRidePref),
              SizedBox(height: BlaSpacings.m),

              // 3 - THE HISTORY
              _buildHistory(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHistory() {
    return SizedBox(
      height: 200, // Set a fixed height
      child: ListView.builder(
        shrinkWrap: true, // Fix ListView height issue
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: RidePrefsService.ridePrefsHistory.length,
        itemBuilder: (ctx, index) => RidePrefsTile(
          ridePref: RidePrefsService.ridePrefsHistory[index],
          onPressed: () =>
              onRidePrefSelected(RidePrefsService.ridePrefsHistory[index]),
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Image.asset(
        blablaHomeImagePath,
        fit: BoxFit.cover, // Adjust image fit to cover the container
      ),
    );
  }
}
