import 'package:flutter/material.dart';

import 'package:state_management_1/view/learn_api/api_integration.dart';
import 'package:state_management_1/view/learn_api/user_api.dart';

class PageViews extends StatefulWidget {
  const PageViews({super.key});

  @override
  State<PageViews> createState() => _PageViewsState();
}

class _PageViewsState extends State<PageViews> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const [HomePage(), UserApi()],
      ),
    );
  }
}
