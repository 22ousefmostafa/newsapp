import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/data/api/app_api.dart';
import 'package:news_app/features/data/model/news_model.dart';
import 'package:news_app/core/network/api_result.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final NewsModel news;

  NewsSuccess(this.news);
}

class NewsFailure extends NewsState {
  final String error;

  NewsFailure(this.error);
}

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  Future<void> getNews() async {
    emit(NewsLoading());

    final result = await AppApi.getNews();

    if (result is Success<NewsModel>) {
      emit(NewsSuccess(result.data));
    } else if (result is Error<NewsModel>) {
      emit(NewsFailure(result.error));
    }
  }
}
