import 'package:clean_arch_bloc_todo_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:clean_arch_bloc_todo_app/features/todo/presentation/pages/home_page.dart';
import 'package:clean_arch_bloc_todo_app/injection_continer.dart';
import 'package:clean_arch_bloc_todo_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoBloc(getIt()),
        ),
      ],
      child: MaterialApp(
        title: 'Todo App',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: HomePage(),
      ),
    );
  }
}
