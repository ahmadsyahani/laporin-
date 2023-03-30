import 'package:flutter/material.dart';
import 'package:laporin/app/controllers/page_index_controller.dart';
import 'package:get/get.dart';
import 'package:laporin/app/routes/app_pages.dart';
import '../controllers/activity_controller.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class ActivityView extends GetView<ActivityController> {
  ActivityView({Key? key}) : super(key: key);
  final pageC = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text('Riwayat'),
            centerTitle: true,
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.ALL_PRESENSI),
                  child: Text("Riwayat Presensi"),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.ALL_LAPORAN),
                  child: Text("Riwayat Laporan"),
                ),
              ],
            ),
          ),
          bottomNavigationBar: ConvexAppBar(
            style: TabStyle.flip,
            initialActiveIndex: pageC.pageIndex.value,
            items: [
              TabItem(icon: Icons.fingerprint, title: 'Presensi'),
              TabItem(icon: Icons.report, title: 'Laporan'),
              TabItem(icon: Icons.home_rounded, title: 'Beranda'),
              TabItem(
                  icon: Icons.history_rounded, title: 'Riwayat'),
              TabItem(icon: Icons.person, title: 'Profile'),
            ],
            onTap: (int i) => pageC.changePage(i),
          ),
        );
  }
}
