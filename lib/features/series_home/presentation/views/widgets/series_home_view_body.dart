import 'package:flutter/material.dart';
import 'package:my_movie_app/core/utils/constants.dart';
import 'package:my_movie_app/core/utils/styles.dart';
import 'package:my_movie_app/core/widgets/movie_app_bar.dart';
import 'package:my_movie_app/features/series_home/presentation/views/widgets/series_airing_today_list_view.dart';
import 'package:my_movie_app/features/series_home/presentation/views/widgets/series_on_the_air_list_view.dart';
import 'package:my_movie_app/features/series_home/presentation/views/widgets/series_popular_list_view.dart';
import 'package:my_movie_app/features/series_home/presentation/views/widgets/series_top_rated_list_view.dart';

class SeriesHomeViewBody extends StatefulWidget {
  const SeriesHomeViewBody({super.key});

  @override
  State<SeriesHomeViewBody> createState() => _SeriesHomeViewBodyState();
}

class _SeriesHomeViewBodyState extends State<SeriesHomeViewBody>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: 4, vsync: this);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const MovieAppBar(),
                const SizedBox(
                  height: 10,
                ),
                showTabs(),
              ],
            ),
          ),
          SliverFillRemaining(
            child: showTabContent(),
          )
        ],
      ),
    );
  }

  Widget showTabs() {
    return TabBar(
      indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Creates border
          color: kIconColor),
      //indicatorColor: Colors.purple,
      controller: _tabController,
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: Colors.black,
      // labelColor: Colors.purple,
      tabs: [
        Tab(
          child: Text(
            'Airing Today',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'Top Rated',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'Popular',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            'On The Air',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget showTabContent() {
    return TabBarView(
      controller: _tabController,
      children: const [
        SeriesAiringTodayListView(),
        SeriesTopRatedListView(),
        SeriesPopularListView(),
        SeriesOnTheAirListView(),
      ],
    );
  }

  Widget trendingMovies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Trending Movies",
          textAlign: TextAlign.start,
          style: Styles.textStyle18,
        ),
        SizedBox(
          height: 10,
        ),
        //  HomeTrendingList(),
      ],
    );
  }

  Widget topRated() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Top Rated Movies',
          textAlign: TextAlign.start,
          style: Styles.textStyle18,
        ),
        SizedBox(
          width: double.infinity,
          height: 150,
          //  child: HomeTopRatedMoviesList(),
        ),
      ],
    );
  }

  Widget upcoming() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Upcoming Movies',
          textAlign: TextAlign.start,
          style: Styles.textStyle18,
        ),
        SizedBox(
          width: double.infinity,
          height: 150,
          //   child: HomeUpcomingMoviesList(),
        ),
      ],
    );
  }

  Widget popular() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Popular',
          textAlign: TextAlign.start,
          style: Styles.textStyle18,
        ),
        SizedBox(
          width: double.infinity,
          height: 150,
          //    child: HomePopularMoviesList(),
        ),
      ],
    );
  }

  Widget nowPlaying() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Now Playing',
          textAlign: TextAlign.start,
          style: Styles.textStyle18,
        ),
        SizedBox(
          width: double.infinity,
          height: 150,
          //     child: HomeNowPlayingMoviesList(),
        ),
      ],
    );
  }
}
