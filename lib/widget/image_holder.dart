import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageHolder extends StatelessWidget {
  final String? amount;
  final String? imageUrl;
  final String? description;

  const ImageHolder({
    super.key,
    required this.amount,
    required this.imageUrl,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 219.w,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 166.h,
                // color: Colors.brown,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    height: 136.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey,
                    ),
                    child: Image.asset(
                      imageUrl!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                width: 219.w,
                padding: const EdgeInsets.only(left: 5),
                // color: Colors.blue,
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    '${amount!}%',
                    style: TextStyle(
                        fontSize: 63.sp,
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                description!,
                style: TextStyle(
                    fontFamily: 'Campton',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp),
              ))
        ],
      ),
    );
  }
}
