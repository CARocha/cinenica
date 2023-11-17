import 'package:cinenica/presentation/providers/movies/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).getNextPage();
  }


  @override
  Widget build(BuildContext context) {

    final moviesPlayingNow = ref.watch(nowPlayingMoviesProvider);
    return ListView.builder(
      itemCount: moviesPlayingNow.length,
      itemBuilder: (context, index) {
        final movie = moviesPlayingNow[index];
        return ListTile(
          title: Text(movie.title),
          subtitle: Text(movie.overview),
          leading: Image.network(movie.posterPath),
        );
      }
      );
  }
}