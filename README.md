# 📐 AppForgeAI

AppForgeAI is a **SwiftUI iOS app** that transforms natural language app ideas into structured technical blueprints using AI — complete with product specs, technical architecture, and cost estimates. It integrates **Google Firebase Auth + Firestore** for user accounts and persistence, and uses the **Gemini API** for smart AI generation.

This project is built with **MVVM**, **SOLID principles**, and has **unit tests** for critical flows.

---

## 🚀 Features

### 🧠 AI Blueprint Generation  
- Converts natural language idea into a structured product blueprint  
- Includes Product, Technical, and Financial sections  
- Integrates OpenAI-compatible Gemini model via Firebase AI Logic

### 🔐 Authentication  
- Google Sign-In  
- Email/Password login  
- Firebase Auth backed

### ☁️ Persistence & History  
- Saves generated blueprints to Firestore  
- Each user stores their own blueprints  
- History view with list + delete

### 📄 UI/UX Enhancements  
- Custom segmented control  
- Snackbar error feedback  
- Copy to clipboard for schema & pitch  
- Monospace schema preview

### 🧪 Testing  
- AuthViewModel unit tests with mock services  
- Blueprint decoding tests with schema validation

---

## 🧰 Architecture

| Layer | Description |
|-------|-------------|
| **MVVM** | Clean separation of views, state and logic |
| **Protocol-Oriented** | AIService, AuthService, Repo protocols |
| **Firebase Backend** | Auth & Firestore persistence |
| **SwiftUI** | Declarative UI with previews |
| **Snackbar** | Custom global error messaging |

---

## 📦 Requirements

- iOS 15+
- Xcode 16.2+
- Firebase project connected
- Gemini Developer API key via Firebase AI Logic

---

## 💡 Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/fece73bd-c94f-46cf-ad20-df2e966b89cb" alt="Screenshot 1" width="250"/>
  <img src="https://github.com/user-attachments/assets/379f9cd4-f08f-47ca-baaa-038e8070863e" alt="Screenshot 2" width="250"/>
  <img src="https://github.com/user-attachments/assets/5d6bf217-3208-460f-8918-c3e93af7e1eb" alt="Screenshot 3" width="250"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/53b371e7-b3a9-4807-b313-69188e29d74a" alt="Screenshot 4" width="250"/>
  <img src="https://github.com/user-attachments/assets/4ad8a1b1-1127-41e9-97bf-d90018211a41" alt="Screenshot 5" width="250"/>
  <img src="https://github.com/user-attachments/assets/99cb4e2b-b62e-4d96-9ef6-bd38999dd1e3" alt="Screenshot 6" width="250"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/191d1a6e-41a2-4b58-88cd-e3502a645a6d" alt="Screenshot 7" width="250"/>
</p>




---

## Author
**Salman Mhaskar**
