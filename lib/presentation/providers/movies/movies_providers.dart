

import 'package:cinenica/domain/entities/movie.dart';
import 'package:cinenica/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMore = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(
    fetchMore: fetchMore,
  );
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {

  int page = 1;
  MovieCallback fetchMore;

  MoviesNotifier({
    required this.fetchMore
  }) : super([]);

  Future<void> getNowPlaying() async {
    // final movies = await movieRepository.getNowPlaying();
    // state = movies;
  }

  Future<void> getNextPage() async {
    page++;
    final movies = await fetchMore(page: page);
    state = [...state, ...movies];
  }


}