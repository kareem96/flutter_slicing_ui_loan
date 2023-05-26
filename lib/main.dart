import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slicing_ui/src/home_bottom_nav_cubit.dart';
import 'package:slicing_ui/src/home_tab.dart';
import 'package:slicing_ui/src/model/person_model.dart';
import 'package:slicing_ui/src/ui/detail_page.dart';
import 'package:slicing_ui/src/ui/home.dart';
import 'package:slicing_ui/src/ui/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme o
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      initialRoute: HomeTab.routeName,
    );
  }

final routes = <String, WidgetBuilder>{
    SplashPage.routeName: (context) => SplashPage(),
    DetailPage.routeName: (context) => DetailPage(personModel: ModalRoute.of(context)?.settings.arguments as PersonModel,),
    HomeTab.routeName: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeBottomNavIndexBloc())
        ], 
        child: HomeTab()
    ),
  };
}
