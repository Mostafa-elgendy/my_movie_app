import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/widgets/custom_error_widget.dart';
import 'package:my_movie_app/core/widgets/custom_loading_indicator.dart';
import 'package:my_movie_app/features/series_home/presentation/view_models/on_the_air/on_the_air_series_cubit.dart';
import 'package:my_movie_app/features/series_home/presentation/views/widgets/series_on_the_air_list_view_item.dart';

class SeriesOnTheAirListView extends StatelessWidget {
  const SeriesOnTheAirListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnTheAirSeriesCubit, OnTheAirSeriesState>(
      builder: (context, state) {
        if (state is OnTheAirSeriesSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.series.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SeriesOnTheAirListViewItem(
                    seriesModel: state.series[index]),
              );
            },
          );
        } else if (state is OnTheAirSeriesFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
