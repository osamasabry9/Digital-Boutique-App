import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryUploadImage extends StatelessWidget {
  const CategoryUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            'https://www.cnet.com/a/img/resize/a55ce58ff6bcb46cc8ada3adf23193e7e7bbb338/hub/2019/10/09/c4f49e5f-459e-4c9f-bfc9-9e4e9d6256d5/nikon-z50-10.jpg?auto=webp&width=1200',
          ),
        ),
      ),
    );
  }
}
