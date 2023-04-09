import 'package:equatable/equatable.dart';
import 'package:fetch_api_cubit/models/failure_model.dart';

import '../models/post_model.dart';

abstract class PostFetchState extends Equatable {
  const PostFetchState();

  @override
  List<Object> get props => [];
}

class PostFetchInitial extends PostFetchState {}

class PostFetchLoading extends PostFetchState {}

class PostFetchLoaded extends PostFetchState {
  final List<Post> postList;

  const PostFetchLoaded({required this.postList});

  @override
  List<Object> get props => [];
}

class PostFetchError extends PostFetchState {
  final Failure failure;

  const PostFetchError({required this.failure});

  @override
  List<Object> get props => [failure];
}
