import 'package:flutter/material.dart';
import 'package:wordspy/utils/constants.dart';

class ScanModeDialog extends StatelessWidget {
  const ScanModeDialog({
    super.key,
    required this.onCamera,
    required this.onGallery,
  });

  final VoidCallback onCamera;
  final VoidCallback onGallery;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      elevation: 0,
      content: Container(
        width: 300,
        height: 190,
        decoration: BoxDecoration(
          color: kCreamColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                'CHOOSE',
                style: kLargeTextStyle.copyWith(color: Colors.black26),
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          onCamera();
                          Navigator.pop(context);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 5,
                          children: [
                            Icon(
                              Icons.add_a_photo_outlined,
                              size: 70,
                              color: kDarkCreamColor,
                            ),
                            Text(
                              'TAKE A\nPICTURE',
                              style: kSmallTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(color: kDarkCreamColor, thickness: 5),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          onGallery();
                          Navigator.pop(context);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 5,
                          children: [
                            Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 70,
                              color: kDarkCreamColor,
                            ),
                            Text(
                              'CHOOSE FROM\nGALLERY',
                              style: kSmallTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
