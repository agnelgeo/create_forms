import 'package:albedo/components/colours.dart';
import 'package:albedo/components/custom_radio_button.dart';
import 'package:albedo/components/text_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:albedo/components/custom_text_field.dart';
import 'package:albedo/components/selectable_button.dart';

class CreateTeacherAccount extends StatefulWidget {
  @override
  _CreateTeacherAccountState createState() => _CreateTeacherAccountState();
}

class _CreateTeacherAccountState extends State<CreateTeacherAccount> {
  bool _isOnlineSelected = false;
  List<String> _selectedValues = [];

  void _handleSelection(bool isSelected, String label) {
    setState(() {
      if (isSelected) {
        _selectedValues.add(label);
      } else {
        _selectedValues.remove(label);
      }
    });
  }

  void _handleRadioValueChange(bool? value) {
    setState(() {
      _isOnlineSelected = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.secondary,
              AppColors.background,
              AppColors.background,
              AppColors.secondary,
            ],
            stops: [
              0.0,
              0.45,
              0.55,
              1.0,
            ],
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            title: const Center(
              child: Icon(Icons.star),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {},
              ),
            ],
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return _buildMobileLayout(context);
              } else {
                return _buildTabletLayout(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              'Create Teacher Account',
              style: TextStyle(
                fontSize: TextSizes.headingSize(context),
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 16),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Icon(
                        Icons.person_outline_rounded,
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildFormFields(context),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.button),
                      child:  Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.white,fontSize: TextSizes.subheadingSize(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Create Teacher Account',
              style: TextStyle(
                fontSize: TextSizes.headingSize(context),
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primary,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.purple[100],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: const Icon(
                        Icons.person_outline_rounded,
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildFormFields(context),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: TextSizes.bodyTextSize(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildFormFields(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(label: 'Name'),
        const CustomTextField(label: 'Email', isEmail: true),
        const CustomTextField(label: 'Phone', isNumber: true),
        const CustomTextField(label: 'Whatsapp No', isNumber: true),
        _buildDropdownField(context,
            label: 'State', hintText: '--Select State--'),
        const CustomTextField(label: 'Place / Panchayath'),
        _buildDropdownField(context,
            label: 'Qualification', hintText: '--Select Qualification--'),
        const CustomTextField(label: 'Course Specification'),
        _buildExperienceField(context),
        const CustomTextField(label: 'Company Name Previous Worked'),
        _buildSelectionBoxes(label: 'Preferred Class'),
        SizedBox(height: 5,),
        _buildSelectionBoxes(label: 'Preferred Subject'),
        _buildDropdownField(context,
            label: 'Syllabus', hintText: '--Select Syllabus--'),
        _buildRadioGroup(),
        _buildFileUploadField(label: 'Experience'),
        const CustomTextField(label: 'User Name'),
        const CustomTextField(label: 'Password', isPassword: true),
        const CustomTextField(label: 'Re-Enter Password', isPassword: true),
      ],
    );
  }

  Widget _buildDropdownField(
    BuildContext context, {
    required String label,
    required String hintText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: TextSizes.bodyTextSize(context),
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColors.secondary,
            ),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle:  TextStyle(
                  color: AppColors.textColor,
                  fontSize: TextSizes.bodyTextSize(context),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 2.0,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              ),
              dropdownColor: AppColors.secondary,
              style: const TextStyle(
                color: AppColors.textColor,
              ),
              items: [
                DropdownMenuItem(
                  value: 'option1',
                  child: Text(
                    'Option 1',
                    style: TextStyle(
                      fontSize: TextSizes.bodyTextSize(context),
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'option2',
                  child: Text('Option 2',
                      style: TextStyle(
                        fontSize: TextSizes.bodyTextSize(context),
                      )),
                ),
              ],
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionBoxes({required String label}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double buttonWidth = constraints.maxWidth / 3 - 6;
        double buttonHeight = constraints.maxWidth * 0.10;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style:  TextStyle(
                color: AppColors.textColor,
                fontSize:  TextSizes.bodyTextSize(context),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SelectableButton(
                        label: 'xxxxxx',
                        width: buttonWidth,
                        height: buttonHeight,
                        onSelected: _handleSelection),
                    SelectableButton(
                        label: 'xxxxxx',
                        width: buttonWidth,
                        height: buttonHeight,
                        onSelected: _handleSelection),
                    SelectableButton(
                        label: 'xxxxxx',
                        width: buttonWidth,
                        height: buttonHeight,
                        onSelected: _handleSelection),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SelectableButton(
                        label: 'xxxxxx',
                        width: buttonWidth,
                        height: buttonHeight,
                        onSelected: _handleSelection),
                    SelectableButton(
                        label: 'xxxxxx',
                        width: buttonWidth,
                        height: buttonHeight,
                        onSelected: _handleSelection),
                    SelectableButton(
                        label: 'xxxxxx',
                        width: buttonWidth,
                        height: buttonHeight,
                        onSelected: _handleSelection),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildExperienceField(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    int _value = 0;
    final int _minValue = 0;
    final int _maxValue = 100;
    void _increment() {
      if (_value < _maxValue) {
        _value++;
        _controller.text = _value.toString();
      }
    }

    void _decrement() {
      if (_value > _minValue) {
        _value--;
        _controller.text = _value.toString();
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Experience',
            style: TextStyle(
              color: AppColors.textColor,
              fontSize:  TextSizes.subheadingSize(context),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _controller,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          onChanged: (value) {
                            final int? newValue = int.tryParse(value);
                            if (newValue != null &&
                                newValue >= _minValue &&
                                newValue <= _maxValue) {
                              setState(() {
                                _value = newValue;
                              });
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.arrow_drop_up),
                                color: Colors.white,
                                onPressed: _increment,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.arrow_drop_down),
                                color: Colors.white,
                                onPressed: _decrement,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRadioGroup() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Preferred Mode',
            style: TextStyle(
              color: AppColors.textColor,
              fontSize:TextSizes.bodyTextSize(context),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              CustomRadioButton(
                title: 'Online Tuition',
                isSelected: _isOnlineSelected,
                onChanged: (value) {
                  setState(() {
                    _isOnlineSelected = value ?? false;
                  });
                },
              ),
              CustomRadioButton(
                title: 'Offline Tuition',
                isSelected: !_isOnlineSelected,
                onChanged: (value) {
                  setState(() {
                    _isOnlineSelected = !(value ?? false);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFileUploadField({required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style:  TextStyle(
              color: AppColors.textColor,
              fontSize: TextSizes.bodyTextSize(context),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Add file picker logic here
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      minimumSize: const Size(120, 60),
                    ),
                    child:  Text(
                      'Choose File',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: TextSizes.bodyTextSize(context),
                      ),
                    ),
                  ),
                ),
                 Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'No file chosen',
                      hintStyle: TextStyle(
                        color: AppColors.textColor,
                        fontSize: TextSizes.bodyTextSize(context),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    readOnly: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      color: AppColors.footerBackground,
      child:  Text(
        'All Copyright Reserved @ albedo©2024',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white,fontSize: TextSizes.bodyTextSize(context),),

      ),
    );
  }
}
