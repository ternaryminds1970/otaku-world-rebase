import 'package:flutter/material.dart';
import 'package:otaku_world/theme/colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MyListShimmer extends StatelessWidget {
  const MyListShimmer({
    super.key,
    required this.showFilters,
    required this.isSliver,
  });

  final bool showFilters;
  final bool isSliver;

  @override
  Widget build(BuildContext context) {
    final widget = SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            if (showFilters)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Shimmer(
                          child: Container(
                            height: 48,
                            color: AppColors.graniteGray,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Shimmer(
                        child: Container(
                          width: 50,
                          height: 50,
                          color: AppColors.graniteGray,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (showFilters)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Shimmer(
                    child: Container(
                      height: 48,
                      color: AppColors.graniteGray,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 5),
            _buildSection(3),
            _buildSection(1),
            _buildSection(2),
          ],
        ),
      ),
    );

    return isSliver
        ? widget
        : CustomScrollView(
            slivers: [widget],
          );
  }

  Widget _buildSection(int count) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Shimmer(
            child: Container(
              width: 100,
              height: 20,
              color: AppColors.graniteGray,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: count,
          itemBuilder: (context, index) => _buildCard(context),
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      height: 165,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.blackOlive,
      ),
      child: Row(
        children: [
          SizedBox(
            height: 145,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Shimmer(
                child: AspectRatio(
                  aspectRatio: 85 / 130,
                  child: Container(color: AppColors.htmlGray),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Shimmer(
                      child: Container(
                        width:width * 0.58,
                        height: 20,
                        color: AppColors.htmlGray,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Shimmer(
                      child: Container(
                        width: width * 0.4,
                        height: 20,
                        color: AppColors.htmlGray,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Shimmer(
                      child: Container(
                        width: width * 0.34,
                        height: 15,
                        color: AppColors.htmlGray,
                      ),
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Shimmer(
                  child: Container(
                    width: width * 0.58,
                    height: 22,
                    color: AppColors.htmlGray,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
