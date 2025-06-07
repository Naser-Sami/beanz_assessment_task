# 📰 Flutter News App (Mobile, Tablet, and Web)

A **responsive Flutter App** that fetches and displays news articles from [NewsAPI.org](https://newsapi.org/). The app adapts to mobile, tablet, and desktop screens with clean architecture, Bloc/Cubit state management, and data caching using Hive.

---

## ✅ Core Functionality

### 🏠 News Dashboard

- Displays list/grid of latest news articles
- Responsive layout:
  - Grid for desktop/tablet
  - List for mobile
- Article card includes:
  - Title
  - Image Thumbnail
  - Author
  - Published Date
- Clickable cards navigate to article details

### 📄 Article Details Page

- Full article content or summary
- Metadata: Source, Author, Published Date
- “Back to Dashboard” navigation

### 🔍 Search Functionality

- Search articles by keyword
- Debounced input to limit API calls

### 📜 Pagination

- Web/Desktop/Tablet: Numbered pagination
- Mobile: Infinite scroll (load more on scroll)

---

## 🧠 Technical Highlights

- **Flutter** (latest stable version)
- **State Management** with `flutter_bloc` and `Cubit`
- **Networking** using `Dio` with `pretty_dio_logger`
- **Routing** with `go_router`
- **Responsive UI** with `MediaQuery`, `LayoutBuilder`, and adaptive breakpoints
- **Data Caching** using `Hive`
  - Caches detailed articles and shows them on refresh
- **Dark/Light Theme** switching based on system theme
- **Clean Architecture**: Modular and scalable

---

## 📁 Folder Structure

lib/
├── config/ # Adaptive Design, Routing, Theme, Typography, Dimensions
├── core/ # Constants, Services, Extensions, Utilities
├── shared/ # Reusable widgets and components
├── features/ # Feature-based structure
│ ├── data/
│ │ ├── data_source/ # Local and Remote sources
│ │ ├── mapper/ # Entity-Model mapping
│ │ ├── models/
│ │ └── repository/ # Implementation of repositories
│ ├── domain/
│ │ ├── entities/
│ │ ├── params/
│ │ ├── queries/
│ │ ├── repository/ # Abstract repository interface
│ │ └── usecases/
│ └── presentation/
│ ├── controllers/ # Bloc, Cubit, etc.
│ ├── screens/
│ └── widgets/
├── app.dart  
└── main.dart # App entry point

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  go_router: ^15.1.2
  flutter_bloc: ^9.1.1
  hydrated_bloc: ^10.0.0
  path_provider: ^2.1.5
  equatable: ^2.0.7
  url_strategy: ^0.3.0
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  get_it: ^8.0.3
  dio: ^5.8.0+1
  pretty_dio_logger: ^1.4.0
  cached_network_image: ^3.4.1
  dartz: ^0.10.1
  intl: ^0.20.2
  flutter_dotenv: ^5.2.1
  flutter_native_splash: ^2.4.6
  rxdart: ^0.28.0
  uuid: ^4.5.1

dev_dependencies:
  hive_generator: ^2.0.1
  build_runner: ^2.4.6
```

🛠️ Getting Started

⚙️ Prerequisites
• Flutter SDK (latest stable)
• Dart SDK
• IDE (VS Code / Android Studio)
• Internet access to fetch news from the API

# Clone the repo

git clone https://github.com/Naser-Sami/beanz_assessment_task.git

# Navigate into the project directory

cd beanz_assessment_task

# Install dependencies

flutter pub get

# Run the app (for Web)

flutter run -d chrome

# Or run on a connected Android/iOS device

flutter run

---

🔧 Setup & Run

# Clone the repo

git clone https://github.com/Naser-Sami/beanz_assessment_task.git

# Navigate into the project directory

cd beanz_assessment_task

# Install dependencies

flutter pub get

# Run the app (for Web)

flutter run -d chrome

# Or run on a connected Android/iOS device

flutter run

🌐 API
• Uses NewsAPI.org
• Requires a free API key stored using assets/.env in .env file

Example .env file:
NEWS_API_KEY=your_api_key_here

👨‍💻 Author
Made with ❤️ by Naser Sami
GitHub: Naser-Sami

> 🔔 **Note:** Create a `.env` file at the project root and ensure it's not pushed to GitHub by adding it to `.gitignore`.
