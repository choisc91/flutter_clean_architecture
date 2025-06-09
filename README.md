# 🧼 Flutter Clean Architecture Sample

A simple app that searches and displays images using the Pixabay API,  
implemented with a clean architecture structure using **Flutter + Provider + Freezed**.

---

## ⚙️ Development Environment

- Flutter SDK: `>=2.16.1 <3.0.0`
- Key Libraries:
  - `provider` for state management and dependency injection
  - `freezed`, `json_serializable` for data modeling
  - `http` for API communication

---

## 📌 References

- [Freezed Documentation](https://pub.dev/packages/freezed)  
- [Provider Documentation](https://pub.dev/packages/provider)  
- [Pixabay API Docs](https://pixabay.com/api/docs/)  

---

## 🎯 Project Goals

- Learn clean architecture design (separating data, domain, and presentation layers)
- Implement manual dependency injection using Provider
- Use `freezed` for immutable models and state representation
- Handle REST API requests and errors using the `http` package

---

## 🚀 How to Run

```bash
git clone https://github.com/your-repo/flutter-clean-architecture-sample.git
cd flutter-clean-architecture-sample

flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

flutter run
