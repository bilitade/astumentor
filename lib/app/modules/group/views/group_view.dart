import 'package:astumentor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../data/Model/group.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/group_controller.dart';

class GroupView extends GetView<GroupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Color.fromARGB(136, 10, 10, 10)),
        leading: const Icon(
          Icons.groups,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Groups',
          style: TextStyle(color: Colors.black),
        ),

     
         
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: TabBar(
              
                controller: controller.tabcontroller,
                labelColor: Colors.green,
                isScrollable: true,
                indicatorColor: Colors.transparent,
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                ),
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                tabs: controller.myTabs),
          ),
          Expanded(
            
            child: TabBarView(

              controller: controller.tabcontroller,
              children: <Widget>[


                Obx(() => Center(
                        child: RefreshIndicator(
                      child: ListView.builder(
                          itemCount: controller.myGroupList.length,
                          itemBuilder: (BuildContext context, int index) {
                            Group group = controller.myGroupList[index];

                            return GFCard(
                              elevation: 5,
                                padding: const EdgeInsets.all(1),
                                margin: const EdgeInsets.all(2),
                                borderRadius: BorderRadius.circular(2),

                                title: GFListTile(
                                  onTap: () => {
                                 Get.toNamed(Routes.GROUP_HOME, arguments: [
                                  {"groupId": group.id}
                                ]),
                                    Get.toNamed(Routes.GROUP_HOME)
                                  },
                                  avatar: const GFAvatar(
                                    size: 20,
                                    backgroundImage:
                                        AssetImage('assets/extra/groups.png'),
                                  ),
                                
                                  title: Text(
                                    '${group.name}',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                      subTitle: Text('this is sub title pf the group'),
                                ));

                         
                          }),
                      onRefresh: () => controller.getMyGroup(),
                    )
                    )
                    
                    ),
Obx(() => Center(
                        child: RefreshIndicator(
                      child: ListView.builder(
                          itemCount: controller.otherGroupList.length,
                          itemBuilder: (BuildContext context, int index) {
                            Group group = controller.otherGroupList[index];

                            return GFCard(
                                padding: const EdgeInsets.all(1),
                                margin: const EdgeInsets.all(2),
                                borderRadius: BorderRadius.circular(2),

                                title: GFListTile(
                                  onTap: () => {
                                  Get.toNamed(Routes.GROUP_HOME)

                                    
                                  },
                                  avatar: const GFAvatar(
                                    size: 20,
                                    backgroundImage:
                                        AssetImage('assets/extra/groups.png'),
                                  ),
                                
                                  title: Text(
                                    '${group.name}',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subTitle: Text('this is sub title pf the group'),
                                ));

                         
                          }),
                      onRefresh: () => controller.getOtherGroup(),
                    )
                    )
                    
                    ),































              //  Obx(() => Center(
              //           child: RefreshIndicator(
          
              //         child:controller.otherGroupList.length!=0 ? ListView.builder(
              //             itemCount: controller.otherGroupList.length,
              //             itemBuilder: (BuildContext context, int index) {
              //               Group group = controller.myGroupList[index];

              //               return GFCard(
              //                   padding: const EdgeInsets.all(1),
              //                   margin: const EdgeInsets.all(2),
              //                   borderRadius: BorderRadius.circular(2),

              //                   title: GFListTile(
              //                     onTap: () => {


              //                       print("clicked")
              //                     },
              //                     avatar: const GFAvatar(
              //                       size: 20,
              //                       backgroundImage:
              //                           AssetImage('assets/extra/groups.png'),
              //                     ),
                                
              //                     title: Text(
              //                       '${group.name}',
              //                       style: const TextStyle(
              //                           fontSize: 14,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                   ) );

              //               // return Container(
              //               //   child: ListTile(
              //               //     title: Text('${group.name}'),
              //               //   ),
              //               // );
              //             }):Text("no data"),
              //         onRefresh: () => controller.getOtherGroup() ,
              //       ))),




           
              ],
            ),
          ),
        ],
      ),
    );
  }
}
