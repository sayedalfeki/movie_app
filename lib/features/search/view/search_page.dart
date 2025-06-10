import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/app_custom_widget/error_widget.dart';
import 'package:movie_app/core/app_custom_widget/loading_widget.dart';
import 'package:movie_app/core/app_styles.dart';
import 'package:movie_app/features/movies_page/domain/movies_entity.dart';
import 'package:movie_app/features/search/view_model/search_view_model.dart';
import '../../../core/app_custom_widget/movie_item_widget.dart';
import '../../movies_page/data/movies_remote_dio_data_source_impl.dart';
import '../../movies_page/data/movies_repository_impl.dart';
import '../../movies_page/domain/movies_use_case.dart';
import '../view_model/search_state.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}
class _SearchPageState extends State<SearchPage> {
  SearchViewModel searchViewModel = SearchViewModel(
    MoviesUseCase(
      moviesRepository: MoviesRepositoryImpl(
        moviesDataSourceRepository: MoviesRemoteDioDataSourceImpl(),
      ),
    ),
  );

  List<Movies> movies = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: searchViewModel,
      listener: (context, state) {
        if (state is SearchSuccessState) {
          state.movies.forEach((element) {
            movies.add(element);
          });
        }
      },
      builder:
          (context, state) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: searchViewModel.searchEditingController,
                  // onFieldSubmitted: (value) {
                  //   searchViewModel.getSearchedMovies(value);
                  // },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      movies.clear();
                      searchViewModel.emptySearch();
                    } else {
                      movies.clear();
                      searchViewModel.getSearchedMovies(value);
                    }
                  },
                  style: AppStyles.whiteNormal15,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'search',
                  ),
                ),
                Expanded(
                  child:
                      movies.isNotEmpty
                          ? GridView.builder(
                            controller: searchViewModel.scrollController,
                            itemCount: movies.length,
                            itemBuilder: (context, index) {
                              return index >= movies.length - 2
                                  ? Center(child: CircularProgressIndicator())
                                  : MovieItemWidget(movieEntity: movies[index]);
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2 / 3,
                                  //crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                ),
                          )
                          : state is SearchLoadingState
                          ? LoadingWidget()
                          : state is SearchErrorState
                          ? AppErrorWidget(
                            errorMessage: state.errorMessage ?? '',
                            onPressed: () {
                              searchViewModel.getSearchedMovies(
                                searchViewModel.searchEditingController.text,
                              );
                            },
                          )
                          : Container(),
                ),
              ],
            ),
          ),
    );
  }
}
