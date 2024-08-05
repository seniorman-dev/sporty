
import 'dart:developer';
import 'package:get/get.dart' as getx;






class ProfileController extends getx.GetxController {




  List<String> interestList = [
    'Football',
    'Badmington',
    'Lawn Tennis',
    'Table Tennis',
    'Basketball',
    'Ice Hockey',
    'Motorsports',
    'Bandy',
    'Rugby',
  ];
  List<String> selectedInterestList = []; //SAVE TO DB
  
  
  

  @override
  void dispose() {
    super.dispose();
  }

}