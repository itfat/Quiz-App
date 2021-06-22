import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
     Container( 
      //  padding: EdgeInsets.symmetric(vertical: 14),
        child:SvgPicture.asset("assets/images/wave.svg"),
        
    
    );
  
  
  }
}