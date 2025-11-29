
# 📱 jolly_podcast_test
_A flutter project to create minified version of Jolly Podcast_

<p align="left">
  <img src="https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter" />
  <img src="https://img.shields.io/badge/Dart-3.x-blue?logo=dart" />
  <img src="https://img.shields.io/badge/State%20Management-GetX-yellow" />
  <img src="https://img.shields.io/badge/License-MIT-green" />
</p>

---

## 📚 Table of Contents

1. [Overview](#overview)
2. [Features](#features)
3. [Project Structure](#project-structure)
4. [Tech Stack](#tech-stack)
5. [State Management](#state-management)
6. [Assumptions](#assumptions)
7. [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Running the Project](#running-the-project)
8. [What I Would Improve With More Time](#what-i-would-improve-with-more-time)
9. [Screenshots (Optional)](#screenshots-optional)
10. [Contributing](#contributing)
11. [License](#license)

---

## ⭐ Overview

Provide a brief explanation of the application, its purpose, and its audience.

This Flutter application is a podcast player built with GetX and setState that provides users with a clean interface for browsing and playing podcast episodes.

---

## ✨ Features

- 🎧 Play, pause, and navigate podcast episodes
- 📜 Episode listing
- 🔊 Volume & speed controls
- 🎨 Clean and responsive UI
- 🔁 Persistent state (via GetX)

---

## 📁 Project Structure

lib/
components/
constants/
controllers/
models/
views/
network/
repositories/
services/
styles/
utils/
main.dart


---

## 🛠 Tech Stack

- **Flutter 3.x**
- **Dart 3.x**
- **GetX**
- **setState()**
- **Audio player plugin** (e.g., just_audio)

---

## 🧠 State Management

### **GetX**
- Global/shared state
- Navigation + dependency injection
- Reactive UI binding

### **setState()**
- Simple widget-level UI updates
- Used where no shared state is required

---

## 📝 Assumptions

- Valid podcast API/data source
- Stable internet connection for streaming
- Audio URLs work on all platforms
- Minimal error handling implemented

---

### 🔧 What I Would Improve With More Time
Background audio playback
Playlist & queue management
Download episodes for offline use
Save playback position
Unit + widget testing
Improve animations and UI polish

### Screenshots (Optional)

-  assets/screenshots/

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK
- Android Studio / Xcode / VS Code
- A device or emulator

### Installation and Running the Project

```sh
git clone <your-repo-url>
cd <project-folder>
flutter pub get
flutter run


