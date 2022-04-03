import 'package:astumentor/app/data/Model/comment.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/comment_controller.dart';

class CommentView extends GetView<CommentController> {
  const CommentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputDecoration kInputDecoration(String label) {
      return InputDecoration(
        labelText: label,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(20.0),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(children: [
                Expanded(
                    child: RefreshIndicator(
                        onRefresh: () {
                          return controller.GetComments();
                        },
                        child: ListView.builder(
                            itemCount: controller.commentsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              Comment comment = controller.commentsList[index];
                              return Card(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    image: comment
                                                                .user!.image !=
                                                            null
                                                        ? DecorationImage(
                                                            image: NetworkImage(
                                                                '${comment.user!.image}'),
                                                            fit: BoxFit.cover)
                                                        : null,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Colors.blueGrey),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                '${comment.user!.name}',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          comment.user!.id == controller.userId
                                              ? PopupMenuButton(
                                                  child: const Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 10),
                                                      child: Icon(
                                                        Icons.more_vert,
                                                        color: Colors.black,
                                                      )),
                                                  itemBuilder: (context) => [
                                                    const PopupMenuItem(
                                                        child: Text('Edit'),
                                                        value: 'edit'),
                                                    const PopupMenuItem(
                                                        child: Text('Delete'),
                                                        value: 'delete')
                                                  ],
                                                  onSelected: (val) {
                                                    if (val == 'edit') {
                                                      controller.editCommentId =
                                                          comment.id ?? 0;
                                                      controller
                                                          .txtCommentController
                                                          .text = comment
                                                              .comment ??
                                                          '';
                                                    } else {
                                                      controller.DeleteComment(
                                                          comment.id ?? 0);
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
                                              padding: EdgeInsets.all(8),
                                              child:
                                                  Icon(Icons.public, size: 15),
                                            ),
                                            Text("${comment.created_at}",
                                                style: GoogleFonts.lato(
                                                    fontSize: 12)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${comment.comment}',
                                            style:
                                                GoogleFonts.lato(fontSize: 16)),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }))),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.black26, width: 0.5)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: kInputDecoration('Comment'),
                          controller: controller.txtCommentController,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          if (controller.txtCommentController.text.isNotEmpty) {
                            controller.loading.value = true;

                            if (controller.editCommentId > 0) {
                              controller.EditComment();
                            } else {
                              controller.CreateComment();
                            }
                          }
                        },
                      )
                    ],
                  ),
                )
              ]),
      ),
    );
  }
}
