# bangjeff_challenge

A BangJeff challenge app that displays albums, users, and photos using a comic-inspired black-and-white theme. Built using:

- ✅ Flutter + Dart
- ✅ GetX for state management and routing
- ✅ Dio for API communication
- ✅ JSONPlaceholder API (albums, users, photos)

---

## 🎨 Features

- 🖼️ List albums in a comic-style grid UI
- 👤 Show album owner (username)
- 📚 View photos by album
- 🖼️ Full photo viewer with fallback image (`No Image`) if photo fails to load
- 🔄 Pull-to-refresh
- 💥 Comic-style AppBar and tiles
- ☁️ Dio exception handling with snackbar feedback

## 🛠️ Tech Stack

- **Flutter 3.x**
- **GetX** — state management & navigation
- **Dio** — API handling with error handling
- **JSONPlaceholder API** — public fake REST API

## 🛠️ Project Structure (Modularized)
lib/
├── app/
│   ├── routes/         → GetX route definitions
│   └── modules/
│       ├── home/       → Home screen (albums)
│       ├── album_detail/ → Album photos
│       └── photo_detail/ → Full photo view
├── models/             → Album, User, Photo models
├── services/           → API service using Dio
├── widgets/            → Reusable widgets (AlbumTile, PhotoGridItem)
└── main.dart           → Entry point

## 🌐 API Used

From [JSONPlaceholder](https://jsonplaceholder.typicode.com):

- `GET /albums`
- `GET /users`
- `GET /photos?albumId=X`
- `GET /photos/:id`

Fallback image:  
`https://placehold.co/400x700.png?text=No+Image`

## 🚀 Getting Started

### ✅ Prerequisites

- Flutter SDK installed
- Emulator or Android device with internet
- Run this command to fetch dependencies:

```bash
flutter pub get
flutter run

⚠️ Notes
If failed to fetch data please check:

Internet connection
VPN/proxy ISP
Dio timeout or Android 9+ security policy


📃 License

This project is for learning purposes only.
Feel free to fork, reuse, and modify with credit.