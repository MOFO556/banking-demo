# Domain model

## Money

Stored as `int minorUnits` + `currencyCode`. Never use `double` for balances at rest.

## Profile & session

- One local profile per device DB (`handle`, XP, boost inventory, biometrics flag)
- **Lock screen**: PIN (hashed in SharedPreferences) and optional device biometrics
- **Logout** = lock session (data kept)
- **Create new account** = wipe local DB + PIN + re-onboard
- Onboarding also sets SharedPreferences `mofobank_onboarded_v2` so web and desktop remember the profile across restarts
- Theme and locale live in SharedPreferences (`mofobank_theme_mode`, `mofobank_locale`), not in the profile row

## Accounts

Kinds: `wallet` | `card` | `deposit`. Peer directory wallets use `ownerHandle`.

Primary wallet id: `wallet_main`.

## Cards & vault API

- `BankCards` stores `token`, `lastFour`, `label`, `frozen` - never PAN/CVV
- `CardVaultSecrets` is the mock vault and stores plaintext PAN, expiry, and CVV keyed by token
- `CardVaultApi.fetchSensitiveDetails(token)` is the only reveal path. UI state may hold PAN/CVV only after that call

## Deposits

Products in `DepositCatalog`:

| Id | Period | Educational rate |
|----|--------|------------------|
| flex_daily | per day | 0.03%/day |
| saver_daily | per day | 0.08%/day |
| term_monthly | per month | 1.5%/month |
| premium_monthly | per month | 2.2%/month |

Interest accrues on snapshot load via `accrueAllDeposits`.

## Transfers

- Between own accounts (`wallet` / `card` / `deposit`)
- P2P to seeded directory users (`@alex`, `@mina`, `@samir`)
- `LedgerEntries.idempotencyKey` is optional. `transfer()` does not pass one, so a retried transfer posts again

## Boosts

| Boost | Effect |
|-------|--------|
| Hint pack | +3 hints · highlights correct quiz option |
| Quiz retry | +1 · clears current quiz answers |
| Teal badge | Cosmetic flag on Home |

## Ledger

`LedgerEntry.amountMinor`: **positive = credit**, **negative = debit**. Optional idempotency keys.

## FX

Frankfurter mid-market rate, plus a bank markup (default 1.5%), cached in `FxCache`. If the request fails and a row exists, the quote is the cached mid (`fromCache: true`) and the FX screen says the rate is the last known one. If there is no row, `_fallbackRate` invents a USD-pivot quote (`synthetic: true`, `fromCache: false`) and the screen says it is an estimate.

## Mission settlement

There is no cloned lesson sandbox. Practice on ATM, transfers, FX, and goals posts on the real wallet, and `completeMission` then credits `settleLessonStake` as a second ledger entry.

`settleLessonStake` clamps the ratio to 0–1 and pays `round(stake * ratio)`. Zero performance pays 0. Mission screens pass the quiz score through `.clamp(0.05, 1.0)` first, so a failed quiz still settles at least 5% of the stake.

Stake size is `MissionDef.baseStakeMajor` (major units) scaled by level in `Leveling.stakeForMission`. `completeMission` always converts that stake with 2 decimal places.

`completeMission` runs its own wallet credit, XP, and unlock in one Drift transaction. Funding a savings goal debits the wallet and updates the goal in two separate writes.