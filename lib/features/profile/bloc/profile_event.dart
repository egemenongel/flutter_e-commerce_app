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
