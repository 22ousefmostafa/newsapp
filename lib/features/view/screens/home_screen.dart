import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/features/data/model/news_model.dart';
import 'package:news_app/features/logic/cubit/news_cubit.dart';
import 'package:news_app/features/view/widgets/new_card_widget.dart;
import 'package:news_app/features/view/widgets/custom_error_widget.dart;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202020),
      appBar: AppBar(
        backgroundColor: const Color(0xff1877F2),
        title: const Text(
          'News',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) return const LoadingIndicator();
          if (state is NewsFailure) return CustomErrorWidget(message: state.error);
          if (state is NewsSuccess) {
            final articles = state.news.articles ?? [];
            if (articles.isEmpty) return const EmptyNewsWidget();

            return ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: articles.length,
              itemBuilder: (context, index) => NewsCard(article: articles[index]),
            );
          }
          return const LoadingIndicator();
        },
      ),
    );
  }
}





