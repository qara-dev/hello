import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/profile.dart';
import '../../domain/usecases/get_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.getProfile}) : super(ProfileInitial()) {
    on<LoadProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        final entity = await getProfile(event.id);
        emit(ProfileLoaded(entity));
      } catch (_) {
        emit(ProfileError());
      }
    });
  }

  final GetProfile getProfile;
}
