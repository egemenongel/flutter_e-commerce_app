import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/profile/model/profile_model.dart';
import 'package:ecommerce_app/features/profile/service/profile_service.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileInitial()) {
    on<ProfileInitialized>((_onInitialized));
  }
  ProfileService? profileService;
  void _onInitialized(
      ProfileInitialized event, Emitter<ProfileState> emit) async {
    profileService = ProfileService();
    emit(const ProfileInitial());
    try {
      emit(ProfileLoad(
          isLoading: false,
          profileModel: await profileService?.fetchProfile()));
    } catch (_) {
      emit(ProfileError());
    }
  }
}
