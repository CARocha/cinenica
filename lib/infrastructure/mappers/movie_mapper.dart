

import 'package:cinenica/domain/entities/movie.dart';
import 'package:cinenica/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movieDB) => Movie(
    adult: movieDB.adult, 
    backdropPath: (movieDB.backdropPath != '') 
      ? 'https://image.tmdb.org/t/p/w500/${movieDB.backdropPath}' 
      : 'https://as1.ftcdn.net/v2/jpg/02/79/04/82/1000_F_279048299_LZQT6LVptPqLdrFxGjAqbbZiO8CupwU0.jpg', 
    genreIds: movieDB.genreIds.map((e) => e.toString()).toList(), 
    id: movieDB.id, 
    originalLanguage: movieDB.originalLanguage, 
    originalTitle: movieDB.originalTitle, 
    overview: movieDB.overview, 
    popularity: movieDB.popularity, 
    posterPath: (movieDB.posterPath != '') 
      ? 'https://image.tmdb.org/t/p/w500/${movieDB.posterPath}'
      : 'no-poster', 
    releaseDate: movieDB.releaseDate, 
    title: movieDB.title, 
    video: movieDB.video, 
    voteAverage: movieDB.voteAverage, 
    voteCount: movieDB.voteCount
  );
}