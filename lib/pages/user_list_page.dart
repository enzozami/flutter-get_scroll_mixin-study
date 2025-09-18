import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_scroll_mixin/pages/user_list_controller.dart';

class UserListPage extends StatelessWidget {
  final controller = Get.find<UserListController>();
  UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: controller.obx((state) {
        final totalItems = (state?.length ?? 0);
        return ListView.builder(
          controller: controller.scroll,
          itemCount: totalItems + 1,
          itemBuilder: (context, index) {
            if (index == totalItems) {
              return Obx(
                () {
                  return Visibility(
                    visible: controller.isLoading,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'Carregando novos usuários',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            final user = state?[index];
            return ListTile(
              title: Text(user?.name ?? ''),
              subtitle: Text(user?.email ?? ''),
            );
          },
        );
      }),
    );
  }
}
