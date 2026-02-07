import 'package:frontend/app/lib_view.dart';

import '../agent_register_controller.dart';

import 'register_account.dart';
import 'register_auth.dart';
import 'register_beneficiaries.dart';
import 'register_current_address.dart';
import 'register_document.dart';
import 'register_home_address.dart';
import 'register_insurance_card.dart';
import 'register_occupation.dart';
import 'register_personal_info.dart';
import 'register_recommender.dart';
import 'register_status.dart';
import 'register_summary.dart';
import 'stepper.dart';

class ContentView extends GetView<AgentRegisterController> {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpace.vertical.xl,
        const StepperWidget(),
        AppSpace.vertical.xl,
        Expanded(
          child: Row(
            children: [
              Spacer(),
              Expanded(
                flex: 2,
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  children: [
                    const RegisterAuthWidget(),
                    const RegisterPersonalInfoWidget(),
                    const RegisterHomeAddressWidget(),
                    const RegisterCurrentAddressWidget(),
                    const RegisterStatusWidget(),
                    const RegisterInsuranceCardWidget(),
                    const RegisterOccupationWidget(),
                    const RegisterAccountWidget(),
                    const RegisterBeneficiariesWidget(),
                    const RegisterDocumentWidget(),
                    const RegisterRecommenderWidget(),
                    const RegisterSummaryWidget(),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
