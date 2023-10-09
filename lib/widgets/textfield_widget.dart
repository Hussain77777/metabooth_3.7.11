
import 'package:flutter/material.dart';
import 'package:metabooth/constants/size_config.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.isPassword,
    this.validator,
  });

  final TextEditingController controller;
  final bool? isPassword;
  final String? Function(String?)? validator;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool secureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width(context, 0.1),
      ),
      child: TextFormField(onChanged: (String ?input){
        print("textfield change $input");
      },
        //   style: TextStyle(color: Color(0xFFC8DE00)),
        style: TextStyle(color: Colors.white),
        validator: widget.validator,
        controller: widget.controller,
        obscureText:widget.isPassword==true? secureText:false,
        decoration: InputDecoration(
            suffixIcon: widget.isPassword??false
                ? IconButton(
              icon: Icon(
                secureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
              color: Color(0xFFC8DE00),
              onPressed: () {
                setState(() {
                  secureText = !secureText;
                });
              },
            )
                : IconButton(
              icon: Icon(
                secureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
              color:Colors.white.withOpacity(0),
              onPressed: () {

              },
            ),
            contentPadding:
            EdgeInsets.only(left: SizeConfig.width(context, 0.05)),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xFFC8DE00)),
              borderRadius:
              BorderRadius.circular(SizeConfig.width(context, 0.1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xFFC8DE00)),
              borderRadius:
              BorderRadius.circular(SizeConfig.width(context, 0.1)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xFFC8DE00)),
              borderRadius:
              BorderRadius.circular(SizeConfig.width(context, 0.1)),
            ),disabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 1, color: Color(0xFFC8DE00)),
          borderRadius: BorderRadius.circular(
              SizeConfig.width(context, 0.1)),
        ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide:
              BorderSide(width: 1, color: Color(0xFFC8DE00)),
              borderRadius: BorderRadius.circular(
                  SizeConfig.width(context, 0.1)),
            ),
            border: InputBorder.none,
            fillColor: Colors.white),
      ),
    );
  }
}class NewTextFieldWidget extends StatefulWidget {
  const NewTextFieldWidget({
    super.key,
    required this.controller,
    required this.isPassword,
    this.validator,
  });

  final TextEditingController controller;
  final bool? isPassword;
  final String? Function(String?)? validator;

  @override
  State<NewTextFieldWidget> createState() => _NewTextFieldWidgetState();
}

class _NewTextFieldWidgetState extends State<NewTextFieldWidget> {
  bool secureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width(context, 0.1),
      ),
      child: TextFormField(onChanged: (String ?input){
        print("textfield change $input");
      },
        //   style: TextStyle(color: Color(0xFFC8DE00)),
        style: TextStyle(color: Colors.black),
        validator: widget.validator,
        controller: widget.controller,
        obscureText:widget.isPassword==true? secureText:false,
        decoration: InputDecoration(
            suffixIcon: widget.isPassword??false
                ? IconButton(
              icon: Icon(
                secureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
              color: Color(0xFFC8DE00),
              onPressed: () {
                setState(() {
                  secureText = !secureText;
                });
              },
            )
                : IconButton(
              icon: Icon(
                secureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
              color:Colors.black.withOpacity(0),
              onPressed: () {

              },
            ),
            contentPadding:
            EdgeInsets.only(left: SizeConfig.width(context, 0.05)),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xFFC8DE00)),
              borderRadius:
              BorderRadius.circular(SizeConfig.width(context, 0.1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xFFC8DE00)),
              borderRadius:
              BorderRadius.circular(SizeConfig.width(context, 0.1)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xFFC8DE00)),
              borderRadius:
              BorderRadius.circular(SizeConfig.width(context, 0.1)),
            ),disabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 1, color: Color(0xFFC8DE00)),
          borderRadius: BorderRadius.circular(
              SizeConfig.width(context, 0.1)),
        ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide:
              BorderSide(width: 1, color: Color(0xFFC8DE00)),
              borderRadius: BorderRadius.circular(
                  SizeConfig.width(context, 0.1)),
            ),
            border: InputBorder.none,
            fillColor: Colors.black),
      ),
    );
  }
}
