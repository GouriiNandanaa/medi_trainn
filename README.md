# 🚆 Medi Train - Medicine Delivery in Trains 🚆

### **🔹 About the Project**
Medi Train is a smart medicine delivery service designed for train passengers. It enables users to **order medicines while traveling** and get them delivered at their upcoming station, ensuring **quick and hassle-free access to essential medications**.

---

## **🚀 Features**
✅ **MedExpress** - Order medicine on the go.  
✅ **TrackMyMeds** - Live tracking of your medicine orders.  
✅ **DocOnTrack** - Instant doctor consultations while traveling.  
✅ **SmartPNR Tracker** - Real-time train location tracking (Implemented).  
✅ **AI MedGuide** - AI-powered medicine suggestions.  
✅ **StationCare** - Find nearby medical help at train stations.  
✅ **HealthAssist 24/7** - Chat or call support anytime.  
✅ **Profile Update** - Manage and update user profiles.  

---

## **🛠️ Tech Stack**
- **Frontend:** Flutter (Dart)  
- **Backend:** Node.js with Express.js  
- **Database:** PostgreSQL  
- **APIs:** External Railway APIs for live train tracking  

---

## **📉 API Details**
### **Authentication API**
- **Sign Up:** `POST /api/auth/signin` (email, name, password)  
- **Login:** `POST /api/auth/login` (email, password)  

### **Train Data API**
- External API is called for fetching train station details, updated in `train_station_model.dart`.

---

## **📈 How It Works?**
1️⃣ **Enter Train Number or PNR** - Get live train status and upcoming stations.  
2️⃣ **Search for Medicines** - Select the medicines you need.  
3️⃣ **Find Nearby Pharmacies** - The app suggests pharmacies at upcoming stations.  
4️⃣ **Place Order** - Choose payment method and confirm order.  
5️⃣ **Receive Medicines** - Pick up at the station when the train arrives.  

---

## **📞 Installation & Setup**
To run this project on your local machine, follow these steps:

### **🔹 Prerequisites**
- Flutter installed ([Download Flutter](https://flutter.dev/docs/get-started/install))
- Node.js installed ([Download Node.js](https://nodejs.org/))

### **🔹 Clone the Repository**
```sh
git clone https://github.com/your-username/medi-train.git
cd medi-train
```

### **🔹 Install Dependencies**
```sh
flutter pub get  # Install Flutter dependencies
cd backend
npm install  # Install backend dependencies
```

### **🔹 Run the Application**
#### Start Backend
```sh
cd backend
node server.js
```
#### Start Flutter App
```sh
flutter run
```

---

## **📝 License**
This project is **open-source** and available under the **MIT License**.

---

## **👨‍💻 Contributing**
We welcome contributions! If you’d like to contribute:
1. Fork the repo.
2. Create a new branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -m "Added new feature"`).
4. Push to your branch (`git push origin feature-name`).
5. Open a **Pull Request**.

---

## **📧 Contact**
For any queries or suggestions, feel free to reach out:  
📧 Email: [gourinandana682003@gmail.com](mailto:gourinandana682003@gmail.com)  
📄 GitHub: [github.com/GouriiNandanaa](https://github.com/GouriiNandanaa)  

---

🚆💊 **Medi Train – Making Medicines Accessible on the Go!** 💊🚆

