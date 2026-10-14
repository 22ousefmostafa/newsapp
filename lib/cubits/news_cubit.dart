import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsSuccessState extends NewsState {
  final List articles;
  NewsSuccessState(this.articles);
}

class NewsErrorState extends NewsState {
  final String errorMessage;
  NewsErrorState(this.errorMessage);
}

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  final String apiKey = '2f13740b5dd64ac7a6fc25b03b819ed9';

  Future<void> getNews() async {
    emit(NewsLoadingState());

    final apiUrl =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';
    final url =
        Uri.parse('https://corsproxy.io/?${Uri.encodeComponent(apiUrl)}');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List articles = data['articles'] ?? [];
        emit(NewsSuccessState(articles));
      } else {
        emit(NewsErrorState('Failed to load news'));
      }
    } catch (e) {
      emit(NewsErrorState(e.toString()));
    }
  }
}
