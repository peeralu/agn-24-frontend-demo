import 'package:get/get.dart';

import '../modules/admin/admin_binding.dart';
import '../modules/admin/admin_middleware.dart';
import '../modules/admin_agents/admin_agents_binding.dart';
import '../modules/admin_agents/admin_agents_view.dart';
import '../modules/admin_customers/admin_customers_binding.dart';
import '../modules/admin_customers/admin_customers_view.dart';
import '../modules/admin_insurance/admin_insurance_binding.dart';
import '../modules/admin_insurance/admin_insurance_view.dart';
import '../modules/admin_insurance_form/admin_insurance_form_binding.dart';
import '../modules/admin_insurance_form/admin_insurance_form_view.dart';
import '../modules/admin_reports/admin_reports_binding.dart';
import '../modules/admin_reports/admin_reports_view.dart';
import '../modules/admin_roles/admin_roles_binding.dart';
import '../modules/admin_roles/admin_roles_view.dart';
import '../modules/admin_roles_form/admin_roles_form_binding.dart';
import '../modules/admin_roles_form/admin_roles_form_view.dart';
import '../modules/admin_users/admin_users_binding.dart';
import '../modules/admin_users/admin_users_view.dart';
import '../modules/admin_users_form/admin_users_form_binding.dart';
import '../modules/admin_users_form/admin_users_form_view.dart';
import '../modules/admin_wallet/admin_wallet_binding.dart';
import '../modules/admin_wallet/admin_wallet_view.dart';
import '../modules/agent_commission/agent_commission_binding.dart';
import '../modules/agent_commission/agent_commission_view.dart';
import '../modules/agent_customers/agent_customers_binding.dart';
import '../modules/agent_customers/agent_customers_view.dart';
import '../modules/agent_dashboard/agent_dashboard_binding.dart';
import '../modules/agent_dashboard/agent_dashboard_view.dart';
import '../modules/agent_insurance_search/agent_insurance_search_binding.dart';
import '../modules/agent_insurance_search/agent_insurance_search_view.dart';
import '../modules/agent_profile/agent_profile_binding.dart';
import '../modules/agent_profile/agent_profile_view.dart';
import '../modules/agent_register/agent_register_binding.dart';
import '../modules/agent_register/agent_register_view.dart';
import '../modules/agent_topup/agent_topup_binding.dart';
import '../modules/agent_topup/agent_topup_view.dart';
import '../modules/customer_list/customer_list_binding.dart';
import '../modules/customer_list/customer_list_view.dart';
import '../modules/customer_models/customer_models_binding.dart';
import '../modules/customer_models/customer_models_view.dart';
import '../modules/customer_profile/customer_profile_binding.dart';
import '../modules/customer_profile/customer_profile_view.dart';
import '../modules/forgot_password/forgot_password_binding.dart';
import '../modules/forgot_password/forgot_password_view.dart';
import '../modules/insurance_detail/insurance_detail_binding.dart';
import '../modules/insurance_detail/insurance_detail_view.dart';
import '../modules/insurance_enroll/insurance_enroll_binding.dart';
import '../modules/insurance_enroll/insurance_enroll_view.dart';
import '../modules/insurance_search/insurance_search_binding.dart';
import '../modules/insurance_search/insurance_search_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/main/main_binding.dart';
import '../modules/main/main_view.dart';
import '../modules/register/register_binding.dart';
import '../modules/register/register_view.dart';
import '../modules/report_agents/report_agents_binding.dart';
import '../modules/report_agents/report_agents_view.dart';
import '../modules/report_commission/report_commission_binding.dart';
import '../modules/report_commission/report_commission_view.dart';
import '../modules/report_customers/report_customers_binding.dart';
import '../modules/report_customers/report_customers_view.dart';
import '../modules/report_sales/report_sales_binding.dart';
import '../modules/report_sales/report_sales_view.dart';
import '../modules/report_topup/report_topup_binding.dart';
import '../modules/report_topup/report_topup_view.dart';
import '../modules/wallet_balance/wallet_balance_binding.dart';
import '../modules/wallet_balance/wallet_balance_view.dart';
import '../modules/wallet_history/wallet_history_binding.dart';
import '../modules/wallet_history/wallet_history_view.dart';
import '../modules/wallet_topup/wallet_topup_binding.dart';
import '../modules/wallet_topup/wallet_topup_view.dart';

part 'app_routes.dart';
part 'app_utils.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(name: _Paths.MAIN, page: () => const MainView(), binding: MainBinding(), transition: Transition.fadeIn),
    GetPage(name: _Paths.LOGIN, page: () => const LoginView(), binding: LoginBinding(), transition: Transition.fadeIn),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.CUSTOMER_PROFILE,
      page: () => const CustomerProfileView(),
      binding: CustomerProfileBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.CUSTOMER_MODELS,
      page: () => const CustomerModelsView(),
      binding: CustomerModelsBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.AGENT_DASHBOARD,
      page: () => const AgentDashboardView(),
      binding: AgentDashboardBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.AGENT_PROFILE,
      page: () => const AgentProfileView(),
      binding: AgentProfileBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.AGENT_CUSTOMERS,
      page: () => const AgentCustomersView(),
      binding: AgentCustomersBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.AGENT_INSURANCE_SEARCH,
      page: () => const AgentInsuranceSearchView(),
      binding: AgentInsuranceSearchBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.AGENT_TOPUP,
      page: () => const AgentTopupView(),
      binding: AgentTopupBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.AGENT_COMMISSION,
      page: () => const AgentCommissionView(),
      binding: AgentCommissionBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.INSURANCE_SEARCH,
      page: () => const InsuranceSearchView(),
      binding: InsuranceSearchBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.INSURANCE_DETAIL,
      page: () => const InsuranceDetailView(),
      binding: InsuranceDetailBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.INSURANCE_ENROLL,
      page: () => const InsuranceEnrollView(),
      binding: InsuranceEnrollBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.WALLET_BALANCE,
      page: () => const WalletBalanceView(),
      binding: WalletBalanceBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.WALLET_TOPUP,
      page: () => const WalletTopupView(),
      binding: WalletTopupBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.WALLET_HISTORY,
      page: () => const WalletHistoryView(),
      binding: WalletHistoryBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.REPORT_SALES,
      page: () => const ReportSalesView(),
      binding: ReportSalesBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.REPORT_COMMISSION,
      page: () => const ReportCommissionView(),
      binding: ReportCommissionBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.REPORT_TOPUP,
      page: () => const ReportTopupView(),
      binding: ReportTopupBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.REPORT_AGENTS,
      page: () => const ReportAgentsView(),
      binding: ReportAgentsBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.REPORT_CUSTOMERS,
      page: () => const ReportCustomersView(),
      binding: ReportCustomersBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.ADMIN_AGENTS,
      page: () => const AdminAgentsView(),
      binding: AdminAgentsBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.ADMIN_CUSTOMERS,
      page: () => const AdminCustomersView(),
      binding: AdminCustomersBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.ADMIN_INSURANCE,
      page: () => const AdminInsuranceView(),
      binding: AdminInsuranceBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.ADMIN_REPORTS,
      page: () => const AdminReportsView(),
      binding: AdminReportsBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.ADMIN_USERS,
      page: () => const AdminUsersView(),
      binding: AdminUsersBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.ADMIN_WALLET,
      page: () => const AdminWalletView(),
      binding: AdminWalletBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.ADMIN_INSURANCE_FORM,
      page: () => const AdminInsuranceFormView(),
      binding: AdminInsuranceFormBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.ADMIN_USERS_FORM,
      page: () => const AdminUsersFormView(),
      binding: AdminUsersFormBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.ADMIN_ROLES,
      page: () => const AdminRolesView(),
      binding: AdminRolesBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.ADMIN_ROLES_FORM,
      page: () => const AdminRolesFormView(),
      binding: AdminRolesFormBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.AGENT_REGISTER,
      page: () => const AgentRegisterView(),
      binding: AgentRegisterBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
    GetPage(
      name: _Paths.CUSTOMER_LIST,
      page: () => const CustomerListView(),
      binding: CustomerListBinding(),
      transition: Transition.fadeIn,
      bindings: [AdminBinding()],
    ),
  ];
}
