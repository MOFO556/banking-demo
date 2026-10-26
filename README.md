# MOFOBank

Simulated bank learning app for **Flutter mastery**. Looks like a digital bank while teaching cards, deposits & tax, FX, ATM algorithms, budgeting, transfers, credit, security, and savings goals.

**Play money only** - no real KYC, transfers, or bank credentials. Code still uses ledger invariants, mock card tokenization, and hashed PIN storage.

## Run

```bash
flutter pub get
dart run build_runner build
flutter run -d windows   # or chrome / edge / android
```

Requires Flutter 3.47+ / Dart 3.13+.

### Web notes

Drift on web needs `web/sqlite3.wasm` and `web/drift_worker.js` (already in the repo). Without them, opening the DB fails at onboarding.

### Docker (web only)

The root `Dockerfile` builds the web app and serves it with nginx. Set `PORT` in `.env` file. Compose publishes that port and passes it into nginx.

```bash
docker compose up --build
```

### Mobile pipelines

Android and iOS are artifact that can be built in `.github/workflows/`.

- **Android** (`.github/workflows/android.yml`) runs on Ubuntu and produces `app-release.apk`. Add repository secrets `ANDROID_KEYSTORE_BASE64`, `ANDROID_STORE_PASSWORD`, `ANDROID_KEY_PASSWORD`, and `ANDROID_KEY_ALIAS`.
- **iOS** (`.github/workflows/ios.yml`) runs on a macOS runner with `flutter build ios --release --no-codesign`. An installable IPA needs Xcode, an Apple Developer certificate, and a provisioning profile.

### Auth notes

- First launch: onboarding (name, @handle, PIN, market)
- Later launches: **lock screen** (PIN / biometrics)
- Settings → Lock, or wipe & create a new local account
- Accounts tab: issue cards, open deposits, transfer between pots or to demo peers (`@alex`, `@mina`, `@samir`)

### Windows notes

PIN storage uses `shared_preferences` (hashed), not `flutter_secure_storage`, so you do **not** need Visual Studio ATL (`atlstr.h`).

## Stack

- **Riverpod** - state
- **go_router** - navigation / shell
- **Drift (SQLite)** - local ledger, progress, FX cache
- **http + Frankfurter** - live FX mid-market rates
- **fl_chart** - deposit / budget / credit charts
- **shared_preferences** - hashed PIN + onboarded flag
- **Biometrics** - `local_auth` on Android/iOS; Windows and web re-prompt the PIN. Windows still links `local_auth_windows`; `windows/CMakeLists.txt` defines `_SILENCE_EXPERIMENTAL_COROUTINE_DEPRECATION_WARNINGS`
- **CardVaultApi** - mock bank vault; UI loads details after that call
- **l10n** - English, Russian, Uzbek (`lib/l10n`). Theme (dark / light / system) and language are on onboarding and in Settings, stored in SharedPreferences

## Docs

- [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)
- [docs/DOMAIN.md](docs/DOMAIN.md)
- [docs/CURRICULUM.md](docs/CURRICULUM.md)

## Brand

**MOFOBank** - dark-first UI with teal accent.
