

import 'package:cinenica/domain/datasources/movies_datasource.dart';
import 'package:cinenica/domain/entities/movie.dart';
import 'package:cinenica/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {

  final MoviesDataSource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    return await datasource.getNowPlaying(page: page);
  }
}