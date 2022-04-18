import 'package:airport/common/styles/colors.dart';
import 'package:airport/common/utils/get_image_path.dart';
import 'package:airport/features/schedule/models/schedule_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FlightHeroAvatar extends StatelessWidget {
  final ScheduleItem flight;
  final bool fromSearch;

  const FlightHeroAvatar(
      {Key? key, required this.flight, this.fromSearch = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(tag: '$flight - $fromSearch', child: buildCircleAvatar());
  }

  Widget buildCircleAvatar() {
    return CircleAvatar(
        backgroundColor: lightGrayColor,
        child: (flight.company.image?.url?.isNotEmpty ?? false)
            ? ClipOval(
                child: CachedNetworkImage(
                  imageUrl: getImagePath(flight.company.image!.url!),
                  fit: BoxFit.contain,
                  placeholder: (context, url) {
                    return buildPlaceholder();
                  },
                  errorWidget: (context, url, err) {
                    return buildPlaceholder();
                  },
                ),
              )
            : buildPlaceholder());
  }

  Widget buildPlaceholder() {
    return ClipOval(
      child: Image.asset(
        'assets/company_icons/default.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
