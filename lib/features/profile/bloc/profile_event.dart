part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileInitialized extends ProfileEvent {
  const ProfileInitialized({this.isLoading = true});
  final bool isLoading;
  @override
  List<Object> get props => [isLoading];
}

class ProfileLoaded extends ProfileEvent {
  const ProfileLoaded({this.isLoading = false, required this.profileModel});
  final bool isLoading;
  final ProfileModel profileModel;
  @override
  List<Object> get props => [isLoading, profileModel];
}
