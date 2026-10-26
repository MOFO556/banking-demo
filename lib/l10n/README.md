# MOFOBank localization (en / ru / uz)

## Layout

- `app_en.arb` - template (source of truth for keys)
- `app_ru.arb` / `app_uz.arb` - translations
- Generated: `app_localizations*.dart` (via `flutter gen-l10n`)

## Regenerate

```bash
# rebuild ARBs from quiz_banks + UI table
flutter gen-l10n
```

## Usage in widgets

```dart
import 'package:mofobank/l10n/l10n_ext.dart';

Text(context.l10n.settings);
final (title, subtitle) = localizedMission(context.l10n, MissionId.cards);
```

## Quizzes

Quiz prompt/option keys are in the ARBs (`quiz_*`). Chrome UI and mission titles are fully localized in ru/uz; quiz body text currently falls back to English in ru/uz until those ARB values are translated.
