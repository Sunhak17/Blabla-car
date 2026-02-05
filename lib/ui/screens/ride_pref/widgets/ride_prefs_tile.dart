import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/utils/date_time_utils.dart';
import 'package:flutter/material.dart';

import '../../../../model/ride_pref/ride_pref.dart';

class RidePrefsTile extends StatelessWidget {
  const RidePrefsTile({super.key, required this.ridePref, this.onPressed});

  final RidePref ridePref;
  final VoidCallback? onPressed;

  String get title => "${ridePref.departure.name} → ${ridePref.arrival.name}";

  String get subtitle =>
      "${DateTimeUtils.formatDateTime(ridePref.departureDate)}, ${ridePref.requestedSeats} passenger${ridePref.requestedSeats > 1 ? "s" : ""}";

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.history, color: BlaColors.iconLight),

      title: Text(title, style: BlaTextStyles.body),
      subtitle: Text(
        subtitle,
        style: BlaTextStyles.label.copyWith(color: BlaColors.textLight),
      ),

      trailing: Icon(
        Icons.arrow_forward_ios,
        color: BlaColors.iconLight,
        size: 16,
      ),
    );
  }
}
