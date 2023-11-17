import 'package:cinenica/config/constants/environment.dart';
import 'package:cinenica/domain/datasources/movies_datasource.dart';
import 'package:cinenica/domain/entities/movie.dart';
import 'package:cinenica/infrastructure/mappers/movie_mapper.dart';
import 'package:cinenica/infrastructure/models/moviedb/moviedb_reponse.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    final List<Movie> movies = MovieDbResponse.fromJson(response.data)
        .results
        .where((element) => element.posterPath != 'no-poster')
        .map((e) => MovieMapper.movieDBToEntity(e))
        .toList();
    return movies;
  }
}
