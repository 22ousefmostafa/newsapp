import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/features/logic/cubit/news_cubit.dart';
import 'package:news_app/features/view/screens/details_screen.dart';
import 'package:news_app/features/view/screens/home_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.home,
        routes: {
          AppRoutes.home: (context) => const HomeScreen(),
          AppRoutes.details: (context) {
            final args =
                ModalRoute.of(context)!.settings.arguments
                    as Map<String, String>;

            return DetailsScreen(
              image: args['image']!,
              title: args['title']!,
              category: args['category']!,
            );
          },
        },
      ),
    );
  }
}
