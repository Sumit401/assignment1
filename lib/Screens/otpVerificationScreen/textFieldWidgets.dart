import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/registerPageProviders.dart';
import '../../reusableWidgets/createColor.dart';

otpTextField(context, int i) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width / 6,
      child: Consumer<RegisterProvider>(
        builder: (context, registerProvider, child) {
          return TextFormField(
              onChanged: (value) {
                if(i==1) {
                  registerProvider.getotp1(value);
                  FocusScope.of(context).nextFocus();
                }
                if(i==2) {
                  registerProvider.getotp2(value);
                  FocusScope.of(context).nextFocus();
                }
                if(i==3) {
                  registerProvider.getotp3(value);
                  FocusScope.of(context).nextFocus();
                }if(i==4) {
                  registerProvider.getotp4(value);
                  FocusScope.of(context).unfocus();
                }

              },
              textAlign: TextAlign.center,
              maxLength: 1,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              keyboardType: TextInputType.number,
              decoration: textFormDecoration());
        },
      ));
}

textFormDecoration() {
  return InputDecoration(
      fillColor: hexToColor(blackColor),
      filled: true,
      focusedBorder:
      OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
}