import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/widgets/custom_error_widget.dart';
import 'package:my_movie_app/core/widgets/custom_loading_indicator.dart';
import 'package:my_movie_app/features/series_home/presentation/view_models/popular/popular_series_cubit.dart';
import 'package:my_movie_app/features/series_home/presentation/views/widgets/series_popular_list_view_item.dart';

class SeriesPopularListView extends StatelessWidget {
  const SeriesPopularListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularSeriesCubit, PopularSeriesState>(
      builder: (context, state) {
        if (state is PopularSeriesSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.series.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child:
                    SeriesPopularListViewItem(seriesModel: state.series[index]),
              );
            },
          );
        } else if (state is PopularSeriesFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
