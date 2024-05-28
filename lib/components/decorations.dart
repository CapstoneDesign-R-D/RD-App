import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration textFieldDecoration() {
  return BoxDecoration(
    border: Border.all(
      color: Colors.black,
      width: 1.0,
      style: BorderStyle.solid,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(10.0),
    ), // 둥근 테두리 설정
  );
}

BoxDecoration medInfoIndexDecoration() {
  return BoxDecoration(
    color: Colors.grey, 
    borderRadius: BorderRadius.circular(12)
  );
}