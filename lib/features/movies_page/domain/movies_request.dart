class MoviesRequest {
  num? limit;
  num? page;
  String? quality;
  num? minimumRating;
  String? queryTerm;
  String? genre;
  String? sortBy;
  String? orderBy;
  bool? withRtRatings;
  MoviesRequest({
    this.limit,
    this.genre,
    this.minimumRating,
    this.orderBy,
    this.page,
    this.quality,
    this.queryTerm,
    this.sortBy,
    this.withRtRatings,
  });
  Map<String,dynamic> toJson()
  {
    Map<String,dynamic> movieMap={};
    movieMap['limit']=limit;
    movieMap['page']=page;
    movieMap['quality']=quality;
    movieMap['minimum_rating']=minimumRating;
    movieMap['query_term']=queryTerm;
    movieMap['genre']=genre;
    movieMap['sort_by']=sortBy;
    movieMap['order_by']=orderBy;
    movieMap['with_rt_ratings']=withRtRatings;
    return movieMap;
  }
}
