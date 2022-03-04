import 'package:club_cast/presentation_layer/screens/user_screen/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data_layer/bloc/intial_cubit/general_app_cubit.dart';
import 'data_layer/bloc/login_cubit/login_cubit.dart';
import 'data_layer/bloc/login_cubit/login_states.dart';
import 'data_layer/bloc/room_cubit/room_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RoomCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => GeneralAppCubit(),
        ),
      ],
      child: BlocConsumer<LoginCubit, LoginStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Podland',
            theme: ThemeData(
              appBarTheme:
                  AppBarTheme(color: Theme.of(context).scaffoldBackgroundColor),
              backgroundColor: Colors.white,
              textTheme: TextTheme(
                bodyText1: GoogleFonts.rubik(
                  fontSize: 18,
                  color: Color(0xff59675B),
                ),
                bodyText2: GoogleFonts.rubik(
                  color: Color(0xff59675B),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              iconTheme: IconThemeData(
                color: Color(0xff59675B),
              ),
              scaffoldBackgroundColor: Color(0xffF6F9F4),
              primaryColor: Color(0xff5ADAAC),
              primarySwatch: Colors.green,
              //  backgroundColor: Color(0xffF6F9F4),
            ),
            darkTheme: ThemeData(
              backgroundColor: Colors.grey[800],
              textTheme: TextTheme(
                bodyText1: GoogleFonts.rubik(
                  color: Colors.white,
                  fontSize: 18,
                ),
                bodyText2: GoogleFonts.rubik(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              scaffoldBackgroundColor: Color(0x2BE5E5E5),
              primaryColor: Color(
                0xff6A4CFF,
              ),
            ),
            themeMode: ThemeMode.light,
            home: LoginScreen(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
