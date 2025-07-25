import 'package:otaku_world/core/ui/shimmers/detail_screens/widgets/shimmer_container.dart';
import 'package:otaku_world/utils/extensions.dart';

import '../shimmer_details.dart';

class DescriptionStaffShimmer extends StatelessWidget {
  const DescriptionStaffShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.blackOlive,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          _buildContentShimmer(width),
          _buildContentShimmer(width * 0.8),
          _buildContentShimmer(width * 0.6),
          _buildContentShimmer(width * 0.4),
          _buildContentShimmer(width * 0.7),
          _buildContentShimmer(width * 0.5),
          _buildContentShimmer(width * 0.3),
          10.height,
          _buildContentShimmer(width),
          _buildContentShimmer(width * 0.8),
          _buildContentShimmer(width * 0.6),
          _buildContentShimmer(width * 0.4),
          _buildContentShimmer(width * 0.7),
          _buildContentShimmer(width * 0.5),
          _buildContentShimmer(width * 0.3),
        ],
      ),
    );
  }

  Widget _buildContentShimmer(double width) {
    return ShimmerContainer(
      height: 15,
      width: width,
      radius: 5,
    );
  }
}
