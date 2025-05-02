# GitBuddy

A simple SwiftUI-based GitHub client app that allows users to explore GitHub user profiles and their repositories, focusing on clean architecture, good UX, and maintainable code.

---

## 📱 Functionality

This app allows users to:
- View a list of GitHub users (with avatar and username).
- Tap on a user to see their full profile.
- View detailed profile info: avatar, username, full name, followers, and following.
- See a list of that user's public **non-forked** repositories.
- View each repository's name, language, star count, and description.
- Tap a repository to open it in a WebView inside the app.

All data is fetched using GitHub’s REST API v3. A personal access token is used to avoid hitting the unauthenticated rate limit (60 req/hr).

---

## 📁 Project Structure

> 🧼 The project follows Clean Architecture with separation of concerns, making it scalable and testable.

---

## 🔑 Features

- ✅ **GitHub REST API integration**
- ✅ **Localization including English and Japanese**
- ✅ **Clean Architecture**
- ✅ **Reusable components and network layer**
- ✅ **Asynchronous image loading**
- ✅ **Error handling and loading indicators**
- ✅ **WebView to show repository details**
- ✅ **Token authentication to bypass rate limits**
- ✅ **Clean UI and responsive layout with SwiftUI**
- ✅ **Unit Testing**

---

## 🚀 How to Run

1. Clone the repository
2. Open in Xcode (target: iOS 18+)
3. Replace a `authToken` in `Core/Constants.swift` with your GitHub Personal Access Token:
   ```swift
   static let authToken = "your_token_here"
   ```
4. Run on simulator or device

---

## 👤 Author

Germán Hernández del Rosario
[GitHub Profile](https://github.com/GermanHernandez91)  

---
