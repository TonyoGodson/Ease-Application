import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/utils/constants.dart';
import '../core/utils/helper.dart';
import '../core/utils/string_utils.dart';
import '../data/shared_preferences.dart';
import '../model_view/auth_view_model.dart';

class RememberMeCheckbox extends StatefulWidget {
  @override
  _RememberMeCheckboxState createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  SharedPrefService sharedPrefService = SharedPrefService();
  late bool isChecked;

  @override
  void initState() {
    isChecked = context.read<AuthViewModel>().rememberMe??false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: context.read<AuthViewModel>().rememberMe??false,
          onChanged: (bool? newValue) {
            setState(() {
              isChecked = newValue!;
              sharedPrefService.writeRememberMe(
                  context,
                  Constants.REMEMBER_ME,
                  isChecked);
            });
          },
        ),
        Text(StringUtils.rememberme,
          style: nunitoSans(
              context: context,
              fs: 12
          ),
        ),
      ],
    );
  }
}
