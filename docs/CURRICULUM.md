# Curriculum

The Missions tab unlocks the next guided lesson only after the previous one is completed. Home quick tools still open Cards, FX, and ATM while those rows are locked. Accounts (issue card, open deposit, transfer) is not gated by the track.

| # | Mission | Route | Skills highlighted |
|---|---------|-------|--------------------|
| 0 | Cards & money basics | `/mission/cards` | Animations, tokens, design |
| 1 | Deposits & tax | `/mission/deposits` | Charts, multi-market compare |
| 2 | FX & foreign holdings | `/mission/fx` | HTTP, cache, offline fallback |
| 3 | ATM cash | `/mission/atm` | Real notes, large/fewest/change packs + quiz |
| 4 | Budgeting & cashflow | `/mission/budgeting` | Forms, pie chart |
| 5 | Transfers & IBAN | `/mission/transfers` | Validation, ledger debit |
| 6 | Credit vs debit | `/mission/credit` | Line chart, interest sim |
| 7 | Fraud & security | `/mission/security` | Secure storage, phishing UX |
| 8 | Savings goals | `/mission/savings` | Progress rings, goal fund |

## Stake & RPG

- Soft economy: core free; boosts optional
- Lesson stake settles by performance. Domain math pays 0 at ratio 0. Screens floor the score at 0.05 before they call `completeMission`
- Quiz prompts exist for `en`, `ru`, and `uz`. The `quiz_*` values in `app_ru.arb` and `app_uz.arb` are still the English source text
- Level-up deposits stipend into wallet
- Efficiency score is XP × average quiz accuracy, minus 10 points per euro-like catalog unit spent on boosts. A hint pack costs the same score in every market. The score goes negative when spend outruns XP.

## Markets

RUB, USD, EUR, UZS, GBP, JPY, TRY, KZT - tax figures are **educational approximations**, not legal advice.