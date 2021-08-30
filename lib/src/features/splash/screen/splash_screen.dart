import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/bloc/database/database_bloc.dart';
import '../controller/splash_controller.dart';
import '../widget/splash_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    checkDatabaseAvailability(context);
  }

  @override
  Widget build(BuildContext context) {
    return SplashScaffold();
  }
}
