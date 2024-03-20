import 'package:ask_vgu/route/app_navigator.dart';
import 'package:ask_vgu/utils/assets.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

import 'documents_controller.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documents'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.picture_as_pdf),
                  title: const Text('Module Handbook'),
                  onTap: () {
                    AppNavigators.gotoPdfView(
                      path: AppAssets.moduleHandbook,
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.picture_as_pdf),
                  title: const Text('Curriculum'),
                  onTap: () {
                    AppNavigators.gotoPdfView(
                      path: AppAssets.curriculum,
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('Program Curriculum'),
                  onTap: () {
                    showImageViewer(
                      context,
                      const AssetImage(AppAssets.programCurriculum),
                      swipeDismissible: true,
                      doubleTapZoomable: true,
                      useSafeArea: true,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
