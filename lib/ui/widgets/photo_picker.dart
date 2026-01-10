
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class photo_Picker extends StatelessWidget {
  const photo_Picker({
    super.key, required this.onTap, this.selectedPhoto,
  });
   final VoidCallback onTap;
   final XFile? selectedPhoto;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text('Photo',style: TextStyle(fontWeight: FontWeight.bold),),
              height: 50,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7),
                      bottomLeft: Radius.circular(7)
                  ),
                  color: Colors.grey.shade300
              ),
            ),
            Text(selectedPhoto==null? 'Photo not found':selectedPhoto!.name,
            style: TextStyle(
              overflow: TextOverflow.ellipsis
            ),),
          ],
        ),
      ),
    );
  }
}