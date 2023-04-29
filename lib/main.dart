import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_mmd/blocs/app_theme_bloc/app_theme_bloc.dart';
import 'package:todo_mmd/blocs/home_bloc/home_bloc.dart';
import 'package:todo_mmd/blocs/task_bloc/task_bloc.dart';
import 'package:todo_mmd/screens/home_screen.dart';
import 'package:todo_mmd/screens/splash_view_screen.dart';
import 'package:todo_mmd/simple_bloc_observer.dart';
import 'package:todo_mmd/theme/theme_data_dark.dart';
import 'package:todo_mmd/theme/theme_data_light.dart';

bool isDark = false;
void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => AppThemeBloc()),
        BlocProvider(create: (context) => TaskBloc()),
      ],
      child: BlocConsumer<AppThemeBloc, AppThemeState>(
        listener: (context, state) {
          if (state is DarkModeState) {
            isDark = true;
          } else {
            isDark = false;
          }
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: isDark ? getThemeDataDark() : getThemeDataLight(),
            routes: {
              SplashViewScreen.id: (context) => const SplashViewScreen(),
              HomeScreen.id: (context) => HomeScreen(),
            },
            initialRoute: SplashViewScreen.id,
/*            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'),
              Locale('ar'),
            ],
            localeResolutionCallback: (currentLang, supportLang){
              if (currentLang != null){
                for(Locale locale in supportLang)
                  {
                    if(locale.languageCode == currentLang.languageCode)
                      {
                        return currentLang;
                      }
                  }
              }else {
                return supportLang.first;
              }
            },*/
          );
        },
      ),
    );
  }
}
