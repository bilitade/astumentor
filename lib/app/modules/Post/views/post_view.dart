import 'package:astumentor/app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../../../data/Model/post.dart';
import 'package:get/get.dart';

import 'package:cached_network_image/cached_network_image.dart';
import './util.dart';

import '../controllers/post_controller.dart';

class PostView extends GetWidget<PostController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isloading.value == true) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return RefreshIndicator(
            onRefresh: () => controller.retrievePosts(),
            child: ListView.builder(
                itemCount: controller.postList.length,
                itemBuilder: (BuildContext context, int index) {
                  Post post = controller.postList[index];
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 216, 216, 218)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 38,
                                      height: 38,

                                      child: ClipOval(
                                       
                                        child: CachedNetworkImage(
                                               width: 80.0,
                                               height: 80.0,
                                          fit: BoxFit.contain,
                                          imageUrl: '${post.user!.image}',
                                          progressIndicatorBuilder: (context, url,
                                                  downloadProgress) =>
                                              CircularProgressIndicator(
                                                  value:
                                                      downloadProgress.progress),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),

                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${post.user!.name}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            post.user!.id == controller.userId
                                ? PopupMenuButton(
                                    child: const Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.more_vert,
                                          color: Colors.black,
                                        )),
                                    itemBuilder: (context) => [
                                      const PopupMenuItem(
                                          child: Text('Edit'), value: 'edit'),
                                      const PopupMenuItem(
                                          child: Text('Delete'),
                                          value: 'delete')
                                    ],
                                    onSelected: (val) {
                                      if (val == 'edit') {
                                        //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PostForm(
                                        //    title: 'Edit Post',
                                        //    post: post,
                                        //  )));
                                      } else {
                                        controller
                                            .handleDeletePost(post.id ?? 0);
                                      }
                                    },
                                  )
                                : const SizedBox()
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.public, size: 15),
                              ),
                              Text("${post.created_at}",
                                  style: GoogleFonts.lato(fontSize: 15)),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          width: MediaQuery.of(context).size.width,
                          height: 0.5,
                          color: Colors.black26,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 4, 8, 4),
                          child: Text(
                            '${post.body}',
                            style: GoogleFonts.openSans(),
                          ),
                        ),
                        post.image != null
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                height: 180,
                                margin: const EdgeInsets.only(top: 5),

                                child: CachedNetworkImage(
                                  fit: BoxFit.contain,
                                  imageUrl: '${post.image}',
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                    child: SizedBox(
                                      height: 10,
                                      width: 10,
                                      child: CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),

                        
                              )
                            : SizedBox(
                                height: post.image != null ? 0 : 10,
                              ),
                        Row(
                          children: [
                            kLikeAndComment(
                                post.likesCount ?? 0,
                                post.selfLiked == true
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                post.selfLiked == true
                                    ? Colors.red
                                    : Colors.black54, () {
                              controller.handlePostLikeDislike(post.id ?? 0);
                            }),
                            Container(
                              height: 25,
                              width: 0.5,
                              color: Colors.black38,
                            ),
                            kLikeAndComment(post.commentsCount ?? 0,
                                Icons.sms_outlined, Colors.black54, () {
                              Get.toNamed(Routes.COMMENT, arguments: [
                                {"postId": post.id}
                              ]);
                            }),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 0.5,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  );
                }));
      }
    });
  }
}
