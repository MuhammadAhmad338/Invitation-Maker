import 'package:gap/gap.dart';
import '../../../Const/colors.dart';
import 'package:flutter/material.dart';

class InvitationView extends StatelessWidget {
  const InvitationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Gap(60),
          const Text(
            'Invitation Maker', // Replace Const.title with actual title text if needed
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Gap(15),
          Expanded(
            child: DefaultTabController(
              length: 2, // Only two tabs
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: CColors.greyColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(25)),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    height: 40, // Controls the height of the TabBar
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: CColors
                            .greenColor, // Background color for the selected tab
                        borderRadius:
                            BorderRadius.circular(25), // Rounded corners
                      ),
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Colors.transparent,
                      labelColor: CColors.whiteColor,
                      unselectedLabelColor: CColors.greyColor,
                      tabs: const [
                        Tab(
                          child: Text(
                            'Invitations',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Greeting Cards',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  const Expanded(
                    // Wrap Container with Expanded
                    child: TabBarView(
                      children: [
                        Text("Invitations"),
                        Text("Greeting Cards")
                      ], // Added the second tab view
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
