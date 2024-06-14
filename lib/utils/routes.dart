import 'package:clock_app/scrren/analog_clock/analog.dart';
import 'package:clock_app/scrren/digital_clock/digital_clock.dart';
import 'package:clock_app/scrren/starp_clock/starp_clock.dart';
import 'package:clock_app/scrren/stop_clock/stop_clock.dart';
import 'package:flutter/cupertino.dart';

import '../scrren/home_page/home_page.dart';

class Routes {
  static String home_page = '/';
  static String digital = 'digital';
  static String analog = 'analog';
  static String starp = 'starp';
  static String stop = 'stop';

  static Map<String, WidgetBuilder> myRoutes = {
     home_page: (context) => const HomePage(),
    digital: (context) => const DigitalClock(),
     analog: (context) => const AnalogClock(),
     starp: (context) => const StarpClock(),
    stop: (context) => const StopClock(),

  };
}