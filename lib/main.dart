import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ulearning_1/Pages/sign_in/sign_in.dart';
import 'package:flutter_ulearning_1/Pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_ulearning_1/Pages/welcome/welcome.dart';
import 'package:flutter_ulearning_1/app_blocs.dart';
import 'package:flutter_ulearning_1/app_events.dart';
import 'package:flutter_ulearning_1/app_states.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => WelcomeBloc()),
          BlocProvider(
              // lazy: false, //setting it to false constrols which bloc get called first
              create: (context) => AppBlocs())
        ],
        child: ScreenUtilInit(
            builder: (context, child) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    appBarTheme: const AppBarTheme(
                      elevation: 0,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  home: const Welcome(),
                  routes: {
                    'MyHomePage': (context) => const MyHomePage(),
                    'signIn': (context) => const SignIn()
                  },
                )));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(child: BlocBuilder<AppBlocs, AppStates>(
        builder: (context, State) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                "${BlocProvider.of<AppBlocs>(context).state.counter}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          );
        },
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<AppBlocs>(context).add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<AppBlocs>(context).add(Decrement()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
