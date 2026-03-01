# Kunj Shingala - Professional Portfolio

A modern, high-performance professional portfolio and resume web page built with **Flutter Web**. Designed to showcase projects, professional experience, and technical skills with a premium look and feel.

🚀 **Live Demo:** [https://kunjshingala.github.io/about/](https://kunjshingala.github.io/about/)

---

## ✨ Features

- **Responsive Design:** Optimized for Desktop, Tablet, and Mobile devices.
- **Glassmorphism UI:** Modern frosted-glass navigation and UI elements.
- **Smooth Animations:** Staggered entrance animations and page transitions using `flutter_animate`.
- **Interactive Sections:**
  - **Hero:** Introduction and social links (GitHub, LinkedIn, Email).
  - **Stats:** Key achievements at a glance.
  - **Experience:** Professional journey timeline.
  - **Skills:** Categorized technical expertise.
  - **Projects:** Dynamic showcase fetched from GitHub pinned repositories.
  - **Contact:** Integrated email contact form.
- **Custom Themes:** Clean and professional Material 3 design system with a curated color palette.

---

## 🛠️ Tech Stack

| Category | Technology |
|---|---|
| **Framework** | [Flutter SDK](https://flutter.dev) (Web) |
| **State Management** | [Flutter BLoC](https://pub.dev/packages/flutter_bloc) |
| **Navigation** | [GoRouter](https://pub.dev/packages/go_router) |
| **Styling** | Material 3, Google Fonts (Inter) |
| **Animations** | [flutter_animate](https://pub.dev/packages/flutter_animate) |
| **Icons** | Font Awesome, Material Icons |
| **Networking** | [http](https://pub.dev/packages/http) (GitHub API) |

---

## 🏛️ Architecture

This project follows a **Layer-based Clean Architecture**, separating the codebase into `core` (data & configuration) and `presentation` (UI & state).

```
lib/
├── core/                        # App-wide, reusable infrastructure
│   ├── constants/               # Static data (AppInfo, projects, skills, experience)
│   ├── models/                  # Data classes (Project, Stat, Experience)
│   ├── navigation/              # GoRouter configuration (app_router.dart)
│   ├── services/                # External API calls (github_service.dart)
│   ├── theme/                   # Color palette and design tokens (app_colors.dart)
│   ├── dimensions.dart          # Centralized spacing/size constants
│   └── responsive.dart          # Screen-size breakpoint utilities
│
├── presentation/                # UI layer
│   ├── blocs/                   # BLoC/Cubit state management
│   │   ├── projects/            # ProjectsBloc (fetch & manage project state)
│   │   ├── resume/              # ResumeBloc (PDF download state)
│   │   └── hover/               # HoverCubit (hover effect state)
│   ├── screens/                 # Full-page widgets
│   │   ├── home_screen.dart
│   │   └── all_projects_screen.dart
│   └── widgets/                 # Reusable, composable UI components
│       ├── glass_navbar.dart
│       ├── hero_section.dart
│       ├── stats_section.dart
│       ├── experience_section.dart
│       ├── skills_section.dart
│       ├── projects_section.dart
│       └── ...
│
└── main.dart                    # Entry point & dependency wiring (BlocProviders)
```

### Key Design Decisions

- **BLoC for state management:** All async and UI state is managed via BLoC/Cubit, keeping widgets purely declarative.
- **Manual Dependency Injection:** Services (e.g., `GitHubService`) are instantiated in `main.dart` and injected into BLoCs via constructors — clean, testable, and zero overhead for this scale.
- **Layer-based over Feature-based:** Given the limited number of screens (Home, Projects, Resume), a layer-based structure is more appropriate and avoids unnecessary folder nesting.
- **Responsive utilities in `core`:** `responsive.dart` and `dimensions.dart` keep all layout logic centralized and consistent across sections.

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Stable channel)
- [FVM](https://fvm.app/) (Optional but recommended for version consistency)

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Kunjshingala/about.git
   cd about
   ```

2. **Install dependencies:**
   ```bash
   fvm flutter pub get
   ```

3. **Run on Chrome:**
   ```bash
   fvm flutter run -d chrome
   ```

### Build & Deploy

```bash
fvm flutter build web --base-href "/about/"
```

Deployment is automated via **GitHub Actions** on every push to `main`. See [`.github/workflows/`](.github/workflows/) for the CI/CD pipeline configuration.

---

## 🌿 Branching Strategy

This repository uses a **two-branch workflow**:

| Branch | Purpose |
|---|---|
| `dev` | Active development — all changes are made here |
| `main` | Production — auto-deploys to GitHub Pages on merge |

**Workflow:**
1. Develop and test on `dev`
2. Create a Pull Request from `dev` → `main`
3. Merge to trigger automatic deployment via GitHub Actions

---

## 🧪 Testing

The project has **25 tests** across unit, bloc, and widget test categories.

### Run all tests

```bash
fvm flutter test
```

### Test Structure

```
test/
├── core/
│   ├── models/
│   │   └── project_model_test.dart    # Project.fromJson parsing (GitHub & Pinned API)
│   └── responsive_test.dart           # Breakpoint detection & scale utility
└── presentation/
    ├── blocs/
    │   ├── hover_cubit_test.dart       # HoverCubit state transitions
    │   ├── projects_bloc_test.dart     # ProjectsBloc with mocked GitHubService
    │   └── resume_bloc_test.dart       # ResumeBloc section-change events
    └── widgets/
        └── mobile_drawer_test.dart     # MobileDrawer rendering & tap interaction
```

### Coverage Summary

| File | Type | Tests | What's covered |
|---|---|---|---|
| `resume_bloc_test.dart` | Unit / BLoC | 3 | Initial state; `SectionChanged` emits |
| `responsive_test.dart` | Unit / Widget | 4 | `isMobile`, `isTablet`, `isDesktop`, `scale()` |
| `mobile_drawer_test.dart` | Widget | 2 | Renders name & nav items; `onNavTap` callback |
| `hover_cubit_test.dart` | Unit / BLoC | 4 | Initial state; `setHovered` toggle sequences |
| `project_model_test.dart` | Unit | 7 | REST & Pinned API parsing; nulls; icon mapping |
| `projects_bloc_test.dart` | Unit / BLoC | 4 | Loading → Loaded; Loading → Error; data merge |

### Run individual test files

```bash
# BLoC / Cubit tests
fvm flutter test test/presentation/blocs/resume_bloc_test.dart
fvm flutter test test/presentation/blocs/hover_cubit_test.dart
fvm flutter test test/presentation/blocs/projects_bloc_test.dart

# Model & utility tests
fvm flutter test test/core/models/project_model_test.dart
fvm flutter test test/core/responsive_test.dart

# Widget tests
fvm flutter test test/presentation/widgets/mobile_drawer_test.dart
```

> A **Git pre-commit hook** is also configured to run `flutter analyze` automatically before each commit, preventing lint warnings from entering the codebase.

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

Designed and Developed by **Kunj Shingala**
