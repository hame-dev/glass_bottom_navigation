# glass_bottom_navigation

A customizable frosted-glass bottom navigation bar for Flutter.

## Features

- Simple API: pass `items`, `currentIndex`, and `onTap`
- Optional built-in search action via `onSearchTap`
- Optional leading and trailing glass action buttons such as back, more, close,
  and custom icon buttons
- iOS 26+ native Liquid Glass bottom bar and action buttons when built with the
  latest Apple SDK; Android and older iOS keep the Flutter frosted-glass
  fallback
- Optional `width` and `height` overrides
- Auto layout behavior:
  - Without search: centered bar
  - With search: trailing glass search button layout
- Auto sizing defaults:
  - Width: responsive to device size
  - Height: responsive to device size
- Supports only 2 to 4 navigation items (enforced by assertions)
- Optional `GlassBottomNavStyle` to customize appearance

## Getting started

Add the package:

```yaml
dependencies:
  glass_bottom_navigation: ^0.1.0
```

Then import:

```dart
import 'package:glass_bottom_navigation/glass_bottom_navigation.dart';
```

## Usage

```dart
GlassBottomBar(
  items: const [
    GlassBarItem(icon: Icons.home_rounded, label: 'Home'),
    GlassBarItem(icon: Icons.chat_rounded, label: 'Chat'),
    GlassBarItem(icon: Icons.person_rounded, label: 'Profile'),
  ],
  currentIndex: currentIndex,
  onTap: (index) => setState(() => currentIndex = index),
  // Optional: if omitted, both are auto-sized responsively.
  width: 300,
  height: 60,
  onSearchTap: () {
    // Optional: if null, no search button is shown.
  },
)
```

For iOS 26+ native rendering, pass `nativeSymbolName` on `GlassBarItem` and
custom action buttons so UIKit can render SF Symbols. Also make sure the host
app does not opt into UI compatibility mode. If
`UIDesignRequiresCompatibility` is present in `Info.plist`, set it to `false`
while testing the latest native design.

### Use glass action buttons

```dart
Column(
  children: [
    GlassActionButton(
      item: GlassActionButtonItem.back(
        onTap: () => Navigator.maybePop(context),
      ),
    ),
    const Spacer(),
    GlassBottomBar(
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
    ),
  ],
)
```

Action buttons can also be grouped anywhere in your layout:

```dart
GlassActionButtonRow(
  actions: [
    GlassActionButtonItem.more(onTap: openMenu),
    GlassActionButtonItem(
      type: GlassActionIcon.custom,
      icon: Icons.tune_rounded,
      nativeSymbolName: 'slider.horizontal.3',
      semanticLabel: 'Filters',
      onTap: openFilters,
    ),
  ],
)
```

Or attached directly beside the bottom bar when the screen has enough width:

```dart
GlassBottomBar(
  items: items,
  currentIndex: currentIndex,
  onTap: onTap,
  leadingActions: [
    GlassActionButtonItem.back(onTap: () => Navigator.maybePop(context)),
  ],
  trailingActions: [
    GlassActionButtonItem.more(onTap: openMenu),
  ],
)
```

### Customize style

```dart
GlassBottomBar(
  items: items,
  currentIndex: currentIndex,
  onTap: onTap,
  style: const GlassBottomNavStyle(
    accent: Color(0xFF004D40),
    height: 60,
    widthFactor: 0.90,
  ),
)
```

## Example app

A full runnable demo exists in `/example` and includes:

- 2-tab, 3-tab, and 4-tab setups
- Standalone top glass action buttons
- Bottom navigation used independently from action buttons

## Screenshots / GIFs

### 2 Tabs

![2 Tabs](assets/images/2tab_images.png)

### 3 Tabs

![3 Tabs](assets/images/3tab_images.png)

### 3 Tabs (No Search)

![3 Tabs No Search](assets/images/3tab_image_no_search.png)
