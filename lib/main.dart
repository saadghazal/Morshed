import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:abwaab_practice/screens/responsive_login_screens/login_main_screen.dart';
import 'package:abwaab_practice/screens/responsive_main_screens/morshed_main_screen.dart';
import 'package:abwaab_practice/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
        return BlocProvider<ResponsivenessCubit>(
          create: (context) => ResponsivenessCubit(),
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            supportedLocales: [
              Locale('ar'),
              Locale('en'),
            ],
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              scaffoldBackgroundColor: AppColors.slate100,
              fontFamily: 'Dubai',
              appBarTheme: AppBarTheme(scrolledUnderElevation: 0),
            ),
            home: ResponsiveScreen(),
          ),
        );
      },
    );
  }
}
