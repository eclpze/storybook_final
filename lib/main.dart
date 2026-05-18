import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:finalui/finalui.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Vize.init(context, figmaWidth: 390, figmaHeight: 884);

    return MaterialApp(title: 'Storybook', home: Home(), debugShowCheckedModeBanner: false);
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  bool showError = false;

  Widget colors(Color color, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 81.5.fw,
          height: 48.fh,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r), color: color),
        ),
        SizedBox(height: 4.fh),
        Text(text, style: AppTypography.fieldLabel.copyWith(fontSize: 12.fh)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF8FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24.fh),
              Padding(
                padding: ps(h: 24),
                child: Column(
                  children: [
                    Row(
                      children: [Text('Typography & Colors', style: AppTypography.screenHeader.copyWith(color: AppColors.primary))],
                    ),
                    SizedBox(height: 16.fh),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          colors(AppColors.primary, 'Primary'),
                          SizedBox(width: 8.fw),
                          colors(AppColors.secondary, 'Secondary'),
                          SizedBox(width: 8.fw),
                          colors(AppColors.tertiary, 'Tertiary'),
                          SizedBox(width: 8.fw),
                          colors(AppColors.error, 'Error'),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.fh),
                    Container(
                      width: 350.fw,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r), color: Color(0xffEDEDF9)),
                      padding: pa(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Screen Header (24px)', style: AppTypography.screenHeader),
                          SizedBox(height: 8.fh),
                          Text('Subheader (18px)', style: AppTypography.subHeader),
                          SizedBox(height: 8.fh),
                          Text('Body Medium (16px) - Modern Corporate\nclarity for HR professionals.', style: AppTypography.bodyMedium),
                          SizedBox(height: 8.fh),
                          Text('Body Small (14px) - Used for metadata and dense\ncandidate information.', style: AppTypography.bodySmall),
                          SizedBox(height: 8.fh),
                          Text('Field Label (14px Bold)', style: AppTypography.fieldLabel),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.fh),
                    Row(
                      children: [Text('Buttons', style: AppTypography.screenHeader.copyWith(color: AppColors.primary))],
                    ),
                    SizedBox(height: 16.fh),
                    Row(
                      children: [
                        Spacer(),
                        PrimaryButton(text: 'Primary Default', onButton: () {}),
                        SizedBox(width: 16.fw),
                        DisabledButton(text: 'Primary Disabled', onButton: () {}),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 16.fh),
                    Row(
                      children: [
                        Spacer(),
                        Column(
                          children: [
                            LoadingButton(text: '', onButton: () {}, isLoading: true),
                            SizedBox(height: 4.fh),
                            Text('Primary - Loading', style: AppTypography.bodySmall.copyWith(fontSize: 12.fh)),
                          ],
                        ),
                        SizedBox(width: 16.fw),
                        Column(
                          children: [
                            SecondaryButton(text: 'Secondary', onButton: () {}),
                            SizedBox(height: 4.fh),
                            Text('', style: AppTypography.bodySmall.copyWith(fontSize: 12.fh)),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 16.fh),
                    DestructiveButton(text: 'Destructive Solid', onButton: () {}),
                    SizedBox(height: 32.fh),
                    Row(
                      children: [Text('Input Fields', style: AppTypography.screenHeader.copyWith(color: AppColors.primary))],
                    ),
                    SizedBox(height: 16.fh),
                    CustomTextField(
                      hintText: 'Enter text...',
                      label: 'Default Input',
                      labelStyle: AppTypography.fieldLabel.copyWith(color: Color(0xff434655)),
                    ),
                    SizedBox(height: 24.fh),
                    CustomTextField(
                      hintText: 'Active typing state',
                      label: 'Focused State',
                      labelStyle: AppTypography.fieldLabel.copyWith(color: AppColors.primary),
                    ),
                    SizedBox(height: 24.fh),
                    CustomTextField(
                      hintText: 'Wrong data',
                      label: 'Error State',
                      errorText: showError ? 'Invalid input' : null,
                      labelStyle: AppTypography.fieldLabel.copyWith(color: AppColors.error),
                    ),
                    SizedBox(height: 10.fh),
                    DestructiveButton(
                      text: 'text',
                      onButton: () {
                        setState(() {
                          showError = !showError;
                        });
                      },
                    ),
                    SizedBox(height: 24.fh),
                    CustomTextField(
                      hintText: 'Cannot edit this',
                      label: 'Disabled Input',
                      isEnabled: false,
                      labelStyle: AppTypography.fieldLabel.copyWith(color: Color(0xff737686)),
                    ),
                    SizedBox(height: 24.fh),
                    CustomTextField(
                      hintText: '',
                      label: 'Password Field',
                      isPassword: true,
                      controller: TextEditingController(text: 'password'),
                      labelStyle: AppTypography.fieldLabel.copyWith(color: Color(0xff434655)),
                    ),
                    SizedBox(height: 32.fh),
                    Row(
                      children: [Text('Select & Checkboxes', style: AppTypography.screenHeader.copyWith(color: AppColors.primary))],
                    ),
                    SizedBox(height: 16.fh),
                    Row(children: [Text('Select Department', style: AppTypography.fieldLabel)]),
                    SizedBox(height: 4.fh),
                    CustomDropDown(title: ['1', '2'], borderRadius: 8, color: Color(0xffFAF8FF), padding: 16.fh, margin: 0, hint: 'Engineering', borderColor: Color(0xffC3C6D7)),
                    SizedBox(height: 24.fh),
                    Row(
                      children: [
                        CustomCheckbox(value: true, onChanged: (value) {}),
                        SizedBox(width: 16.fw),
                        Text('Checked', style: AppTypography.bodyMedium),
                      ],
                    ),
                    SizedBox(height: 16.fh),
                    Row(
                      children: [
                        CustomCheckbox(value: false, onChanged: (value) {}),
                        SizedBox(width: 16.fw),
                        Text('Unchecked', style: AppTypography.bodyMedium),
                      ],
                    ),
                    SizedBox(height: 16.fh),
                    Row(
                      children: [
                        CustomCheckbox(value: false, onChanged: (value) {}, enabled: false),
                        SizedBox(width: 16.fw),
                        Text('Disabled', style: AppTypography.bodyMedium),
                      ],
                    ),
                    SizedBox(height: 32.fh),
                    Row(
                      children: [Text('Cards', style: AppTypography.screenHeader.copyWith(color: AppColors.primary))],
                    ),
                    SizedBox(height: 16.fh),
                    CustomCard(width: 330.fw, title: 'Senior Product Designer', text: 'Product Team • Full-time', rent: '\$120k - \$160k', people: '24 Applicants', status: 'Active', color: Colors.white, borderRadius: 12),
                    SizedBox(height: 32.fh),
                    Row(
                      children: [Text('Avatars', style: AppTypography.screenHeader.copyWith(color: AppColors.primary))],
                    ),
                    SizedBox(height: 16.fh),
                    Row(
                      children: [
                        Column(
                          children: [
                            CustomAvatar(size: 60.fw, borderColor: AppColors.primary, color: Colors.white, image: 'images/avatar.png'),
                            SizedBox(height: 4.fh),
                            Text('Photo', style: AppTypography.fieldLabel.copyWith(fontSize: 12.fh)),
                          ],
                        ),
                        SizedBox(width: 32.fw),
                        Column(
                          children: [
                            CustomAvatar(size: 60.fw, borderColor: Color(0xffC3C6D7), color: Color(0xffD3E4FE), name: 'JD'),
                            SizedBox(height: 4.fh),
                            Text('Initials', style: AppTypography.fieldLabel.copyWith(fontSize: 12.fh)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 32.fh),
                    Row(
                      children: [Text('Navigation & Feedback', style: AppTypography.screenHeader.copyWith(color: AppColors.primary))],
                    ),
                    SizedBox(height: 16.fh),
                    ProgressSteps(currentIndex: 0, totalSteps: 3, title: 'Candidate Progress (Step 2 of 3)'),
                    SizedBox(height: 96.5.fh),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomTabBar(
        image: ['icons/vacancies.png', 'icons/candidates.png', 'icons/settings.png'],
        title: ['Vacancies', 'Candidates', 'Settings'],
        selectedValue: selectedIndex,
        onPressed: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        color: Colors.white,
      ),
    );
  }
}
