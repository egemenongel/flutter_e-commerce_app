part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial({this.isLoading = true, this.profileModel});
  final bool isLoading;
  final ProfileModel? profileModel;
  @override
  List<Object> get props => [isLoading];
}

class ProfileLoad extends ProfileState {
  const ProfileLoad({this.isLoading = false, this.profileModel});
  final bool isLoading;
  final ProfileModel? profileModel;
  @override
  List<Object> get props => [isLoading, profileModel!];
}

class ProfileError extends ProfileState {
  @override
  List<Object> get props => [];
}
