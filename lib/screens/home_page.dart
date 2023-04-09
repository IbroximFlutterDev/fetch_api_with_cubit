import 'package:fetch_api_cubit/cubit/post_fetch_cubit.dart';
import 'package:fetch_api_cubit/cubit/post_fetch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/text_constants.dart';
import '../models/post_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Api fetch with cubit'),
        backgroundColor: Colors.red,
        elevation: 5.0,
      ),
      body: BlocBuilder<PostFetchCubit, PostFetchState>(
        builder: (context, state) {
          if (state is PostFetchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostFetchError) {
            return Text(state.failure.message);
          } else if (state is PostFetchLoaded) {
            final postList = state.postList;
            return postList.isEmpty
                ? const Text('No any posts')
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      final Post singlePost = postList[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xff063C27),
                          child: Text(
                            singlePost.id.toString(),
                            style: titleText.copyWith(color: Colors.blue),
                          ),
                        ),
                        title: Text(
                          singlePost.title,
                          style: titleText,
                        ),
                        subtitle: Text(
                          singlePost.body,
                          style: bodyText,
                        ),
                      );
                    },
                  );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
