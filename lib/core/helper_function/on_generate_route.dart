import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/dashboard/views/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (_) => DashboardView());
    default:
      return MaterialPageRoute(builder: (_) => Scaffold());
  }
}
