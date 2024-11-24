import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'privacy_policy_page_model.dart';
export 'privacy_policy_page_model.dart';

class PrivacyPolicyPageWidget extends StatefulWidget {
  const PrivacyPolicyPageWidget({super.key});

  @override
  State<PrivacyPolicyPageWidget> createState() =>
      _PrivacyPolicyPageWidgetState();
}

class _PrivacyPolicyPageWidgetState extends State<PrivacyPolicyPageWidget> {
  late PrivacyPolicyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolicyPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Privacy Policy and Terms of Use',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).titleMediumFamily),
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AutoSizeText(
                    'Last Updated: 3 September 2024\n\nThank you for choosing Second Hand Bazaar (Mobile Application for both android and iOS), operated by Second Hand Bazaar. We are committed to protecting your privacy and ensuring a positive user experience. This document outlines the Privacy Policy and Terms of Use governing your use of the Second Hand Bazaar mobile application.\n\nPrivacy Policy for Second Hand Bazaar\n\nLast Updated: 3 September 2024\n\nThank you for choosing Second Hand Bazaar (\"Mobile Application for both Android and iOS\"), operated by the company Second Hand Bazaar. We are committed to safeguarding your privacy. This Privacy Policy explains how we collect, use, maintain, and disclose information obtained from users (\"Users\" or \"you\") of the Second Hand Bazaar mobile application.\n\n1. Information We Collect:\n\na. Personal Information:\n\nWhen you register on the App, we may collect personal information such as your name, email address, mailing address, phone number, and payment details.\nIf you choose to list products for sale on the App as a seller, we may collect additional information such as product descriptions, pricing, and images.\nWe may collect personal identification information from Users in various ways, including when Users register on the App, place an order, fill out a form, respond to a survey, or interact with other features of the App. Users may be asked for, as appropriate, name, email address, mailing address, phone number, and other relevant information.\n\nb. Non-personal Information:\n\nWe may collect non-personal information about Users, including device information, IP addresses, and browsing activity within the App.\n\nWe may collect non-personal identification information about Users whenever they interact with the App. Non-personal identification information may include the type of device, technical information about Users\' means of connection to our App, such as the operating system, Internet service providers utilized, and other similar information.\n\n2. How We Use Collected Information:\n\na. To Facilitate Transactions: We use the information you provide to facilitate the buying and selling of used items on the App. This includes processing orders, verifying payment details, and coordinating delivery.\n\nb. To Improve User Experience: We may analyze user behavior and feedback to improve our services, enhance the functionality of the App, and personalize your experience.\n\nc. For Communication: We may use your contact information to communicate with you regarding your transactions, account updates, promotional offers, and important notifications.\n\n3. Data Security:\n\na. Protection Measures: We implement appropriate security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction. This includes encryption of sensitive data and regular security assessments.\n\nb. Third-party Services: We may utilize third-party services for payment processing and data storage. We ensure that these service providers adhere to strict security standards to safeguard your information.\n\n4. Sharing Your Information:\n\na. With the Vendor: Your personal information may be shared with the vendor. This is necessary to facilitate transactions and ensure a seamless experience.\n\nb. With Service Providers:We may share your information with trusted service providers who assist us in operating the App, conducting business activities, or providing services to you. These providers are bound by confidentiality agreements and are only authorized to use your information for specified purposes.\n\n5. Your Choices:\n\na. Account Settings: You can review and update your account information at any time by accessing your account settings within the App.\n\nb. Communication Preferences: You have the option to opt out of receiving promotional emails or marketing communications from us by following the unsubscribe instructions provided in the emails or by contacting us directly.\n\n7. Changes to this Privacy Policy:\n\nWe reserve the right to update or modify this Privacy Policy at any time. Any changes will be reflected on this page, and we encourage you to review this Privacy Policy periodically for updates.\n\n8. Contact Us:\n\nIf you have any questions or concerns about this Privacy Policy or our privacy practices, please contact us at secondhandbazaar03@gmail.com\n\nBy using the Second Hand Bazaar App, you signify your acceptance of this Privacy Policy. If you do not agree to this policy, please do not use the App.\n\n',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                  Text(
                    'Terms and Conditions for Second Hand Bazaar\n\nThese Terms and Conditions (\"Terms\") govern your use of the Second Hand Bazaar mobile application (\"App\"), operated by Second Hand Bazaar. By accessing or using the App, you agree to abide by these Terms. If you do not agree to these Terms, please refrain from using the App.\n\n1. User Eligibility:\n\na. The Second Hand Bazaar App is intended for use by individuals who are 18 years of age or older. By accessing the App, you affirm that you are at least 18 years old.\n\nb. If you are accessing the App on behalf of a business entity, you represent and warrant that you have the authority to bind that entity to these Terms.\n\n2. Use of the App:\n\na. You agree to use the Second Hand Bazaar App solely for lawful purposes and in compliance with these Terms and all applicable laws and regulations.\n\nb. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.\n\n3. Listing and Selling Items:\n\na. Sellers may list used items for sale on the App in accordance with our guidelines and policies.\n\nb. Sellers are responsible for providing accurate and up-to-date information about the items they list, including descriptions, pricing, and images.\n\nc. Sellers agree to fulfill their obligations to buyers in a timely manner and to resolve any disputes that may arise in connection with transactions on the App.\n\n4. Purchasing Items:\n\na. Buyers may purchase items listed for sale on the Second Hand Bazaar App.\n\nb. Buyers agree to provide accurate payment and shipping information and to complete transactions in a timely manner.\n\nc. Buyers are responsible for reviewing item descriptions and images carefully before making a purchase.\n\n5. Intellectual Property Rights:\n\na. The Second Hand Bazaar App and all content, features, and functionality are owned by Second Hand Bazaar and are protected by copyright, trademark, and other intellectual property laws.\n\nb. You may not reproduce, distribute, modify, or create derivative works of any content from the App without prior written consent from Second Hand Bazaar.\n\n6. Limitation of Liability:\n\na. To the fullest extent permitted by law, Second Hand Bazaar shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising out of or in connection with your use of the Second Hand Bazaar App.\n\nb. In no event shall Second Hand Bazaar \'s total liability to you for all damages, losses, and causes of action exceed the amount paid by you, if any, for accessing or using the App.\n\n7. Changes to Terms:\n\nSecond Hand Bazaar reserves the right to update or modify these Terms at any time without prior notice. Any changes will be effective immediately upon posting on this page. Your continued use of the App after the posting of revised Terms constitutes your acceptance of the changes.\n\n8. Governing Law:\n\nThese Terms and any dispute arising out of or in connection with them shall be governed by and construed in accordance with the laws of [Jurisdiction], without regard to its conflict of law provisions.\n\n9. Contact Us:\n\nIf you have any questions or concerns about these Terms, please contact us at secondhandbazaar03@gmail.com\n\nBy using the Second Hand Bazaar App, you signify your acceptance of these Terms and agree to be bound by them. If you do not agree to these Terms, please do not use the App.\n',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
