import 'package:bloc/bloc.dart';
import 'package:fetch_api_cubit/models/failure_model.dart';



  import '../models/post_model.dart';
import '../repository/api_repository.dart';
import 'post_fetch_state.dart';

class PostFetchCubit extends Cubit<PostFetchState> {

  final ApiRepository apiRepository;



  PostFetchCubit({required this.apiRepository}) : super(PostFetchInitial());


  Future<void>fetchPostApi()async{
    emit(PostFetchLoading());

    try{
      final List<Post>? postList = await apiRepository.getPostList();
      
      emit(PostFetchLoaded(postList: postList??[]));
    }on Failure catch(err){
     emit(PostFetchError(failure: err));
    }catch(err){
      print(err);
    }
  }

}
