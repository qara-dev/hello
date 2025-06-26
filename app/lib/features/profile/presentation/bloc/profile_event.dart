part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class LoadProfile extends ProfileEvent {
  LoadProfile({required this.id});
  final int id;
}
