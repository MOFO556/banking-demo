import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mofobank/data/repositories/session_controller.dart';
import 'package:mofobank/features/atm/atm_mission_screen.dart';
import 'package:mofobank/features/auth/lock_screen.dart';
import 'package:mofobank/features/auth/settings_screen.dart';
import 'package:mofobank/features/banking/accounts_hub_screen.dart';
import 'package:mofobank/features/banking/card_detail_screen.dart';
import 'package:mofobank/features/banking/open_deposit_screen.dart';
import 'package:mofobank/features/banking/transfer_screen.dart';
import 'package:mofobank/features/budgeting/budgeting_mission_screen.dart';
import 'package:mofobank/features/cards/cards_mission_screen.dart';
import 'package:mofobank/features/credit/credit_mission_screen.dart';
import 'package:mofobank/features/deposits/deposits_mission_screen.dart';
import 'package:mofobank/features/fx/fx_mission_screen.dart';
import 'package:mofobank/features/home/home_screen.dart';
import 'package:mofobank/features/home/home_shell.dart';
import 'package:mofobank/features/home/missions_screen.dart';
import 'package:mofobank/features/onboarding/onboarding_screen.dart';
import 'package:mofobank/features/savings_goals/savings_mission_screen.dart';
import 'package:mofobank/features/security/security_mission_screen.dart';
import 'package:mofobank/features/transfers/transfers_mission_screen.dart';
import 'package:mofobank/features/wallet_rpg/boosts_screen.dart';
import 'package:mofobank/features/wallet_rpg/wallet_screen.dart';

final _rootKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final session = ref.watch(sessionControllerProvider);

  return GoRouter(
    navigatorKey: _rootKey,
    initialLocation: '/home',
    refreshListenable: _GoRouterRefresh(ref),
    redirect: (context, state) {
      final loc = state.matchedLocation;
      final onboarding = loc == '/onboarding';
      final locking = loc == '/lock';

      if (!session.onboarded) return onboarding ? null : '/onboarding';
      if (!session.unlocked) return locking ? null : '/lock';
      if (onboarding || locking) return '/home';
      return null;
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(path: '/lock', builder: (context, state) => const LockScreen()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            HomeShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/missions',
                builder: (context, state) => const MissionsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/accounts',
                builder: (context, state) => const AccountsHubScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/wallet',
                builder: (context, state) => const WalletScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/boosts',
        builder: (context, state) => const BoostsScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/banking/open-deposit',
        builder: (context, state) => const OpenDepositScreen(),
      ),
      GoRoute(
        path: '/banking/transfer',
        builder: (context, state) => const TransferScreen(),
      ),
      GoRoute(
        path: '/banking/card/:id',
        builder: (context, state) =>
            CardDetailScreen(cardId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/mission/cards',
        builder: (context, state) => const CardsMissionScreen(),
      ),
      GoRoute(
        path: '/mission/deposits',
        builder: (context, state) => const DepositsMissionScreen(),
      ),
      GoRoute(
        path: '/mission/fx',
        builder: (context, state) => const FxMissionScreen(),
      ),
      GoRoute(
        path: '/mission/atm',
        builder: (context, state) => const AtmMissionScreen(),
      ),
      GoRoute(
        path: '/mission/budgeting',
        builder: (context, state) => const BudgetingMissionScreen(),
      ),
      GoRoute(
        path: '/mission/transfers',
        builder: (context, state) => const TransfersMissionScreen(),
      ),
      GoRoute(
        path: '/mission/credit',
        builder: (context, state) => const CreditMissionScreen(),
      ),
      GoRoute(
        path: '/mission/security',
        builder: (context, state) => const SecurityMissionScreen(),
      ),
      GoRoute(
        path: '/mission/savings',
        builder: (context, state) => const SavingsMissionScreen(),
      ),
    ],
  );
});

class _GoRouterRefresh extends ChangeNotifier {
  _GoRouterRefresh(this.ref) {
    ref.listen(sessionControllerProvider, (_, _) => notifyListeners());
  }

  final Ref ref;
}
