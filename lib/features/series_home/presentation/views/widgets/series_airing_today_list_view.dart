import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/core/widgets/custom_error_widget.dart';
import 'package:my_movie_app/core/widgets/custom_loading_indicator.dart';
import 'package:my_movie_app/features/series_home/presentation/view_models/airing_today/airing_today_series_cubit.dart';
import 'package:my_movie_app/features/series_home/presentation/views/widgets/series_airing_today_list_view_item.dart';

class SeriesAiringTodayListView extends StatelessWidget {
  const SeriesAiringTodayListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiringTodaySeriesCubit, AiringTodaySeriesState>(
      builder: (context, state) {
        if (state is AiringTodaySeriesSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.series.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SeriesAiringTodayListViewItem(
                    seriesModel: state.series[index]),
              );
            },
          );
        } else if (state is AiringTodaySeriesFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
