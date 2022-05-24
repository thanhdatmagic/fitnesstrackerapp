import 'package:fitnesstrackerapp/screens/workout_detail_screen/page/workout_detail_page.dart';
import 'package:fitnesstrackerapp/screens/workouts/bloc/workouts_bloc.dart';
import 'package:fitnesstrackerapp/screens/workouts/widget/workouts_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildContext(context));
  }

  BlocProvider<WorkoutsBloc> _buildContext(BuildContext context) {
    return BlocProvider<WorkoutsBloc>(
      create: (context) => WorkoutsBloc(),
      child: BlocConsumer<WorkoutsBloc, WorkoutsState>(
        buildWhen: (_, currState) => currState is WorkoutsInitial,
        builder: (context, state) {
          return WorkoutContent();
        },
        listenWhen: (_, currState) => currState is CardTappedState,
        listener: (context, state) {
          if (state is CardTappedState) {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (_) => WorkoutDetailsPage(workout: state.workout),
              ),
            );
          }
        },
      ),
    );
  }
}