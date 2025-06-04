# 🧼 Flutter Clean Architecture Sample

Pixabay API를 통해 이미지를 검색하고 화면에 표시하는 간단한 앱으로,  
**Flutter + Provider + Freezed**를 사용해 클린 아키텍처 구조를 구현한 예제입니다.

---

## ⚙️ 개발 환경

- Flutter SDK: `>=2.16.1 <3.0.0`
- 주요 라이브러리:
  - `provider` for 상태 관리 및 DI
  - `freezed`, `json_serializable` for 데이터 모델
  - `http` for API 통신

---

## 📌 참고 문서

- [Freezed 공식 문서](https://pub.dev/packages/freezed)  
- [Provider 공식 문서](https://pub.dev/packages/provider)  
- [Pixabay API 문서](https://pixabay.com/api/docs/)  

---

## 🎯 프로젝트 목적

- 클린 아키텍처 설계 학습 (data, domain, presentation 계층 분리)
- Provider 기반의 수동 DI 구조 구현
- `freezed`를 이용한 immutable 모델 및 상태 표현
- `http` 패키지를 이용한 REST API 호출과 오류 처리

---

## 🚀 실행 방법

```bash
git clone https://github.com/your-repo/flutter-clean-architecture-sample.git
cd flutter-clean-architecture-sample

flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

flutter run
