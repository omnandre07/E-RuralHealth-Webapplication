<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>DigiHealthCard - Home</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- Bootstrap & Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
  
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #F7F9FB;
      margin: 0;
    }

    nav {
      background-color: #1f4ed8;
      color: white;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 15px 40px;
      position: fixed;
      width: 100%;
      z-index: 999;
    }

    .logo {
      font-size: 22px;
      font-weight: bold;
      letter-spacing: 1px;
    }

    .logo span {
      display: block;
      font-size: 12px;
      font-weight: 400;
      color: #c5d9ff;
      margin-top: 2px;
    }

    .nav-links {
      display: flex;
      gap: 20px;
    }

    .nav-links a {
      text-decoration: none;
      padding: 8px 16px;
      color: white;
      font-weight: 500;
      transition: 0.3s;
      border-radius: 5px;
    }

    .nav-links a:hover {
      background-color: #e0e7ff;
      color: #1f4ed8;
    }

    .hero-section {
      position: relative;
      height: 100vh;
      color: white;
      overflow: hidden;
      display: flex;
      align-items: center;
    }

    .hero-section video {
      position: absolute;
      top: 0;
      left: 0;
      object-fit: cover;
      width: 100%;
      height: 100%;
      z-index: 0;
    }

    .hero-content {
      position: relative;
      z-index: 1;
      padding-left: 5%;
      max-width: 700px;
    }

    .hero-content h1 {
      font-size: 3.5rem;
      font-weight: 800;
    }

    .hero-content p {
      font-size: 1.2rem;
      margin-top: 10px;
      color: #f1f1f1;
    }

    section {
      padding: 80px 20px;
    }

    h2 {
      color: #1F3B73;
      font-weight: 700;
      text-align: center;
      margin-bottom: 40px;
    }

    .login-card {
      text-align: center;
      border: 1px solid #ddd;
      padding: 30px;
      border-radius: 10px;
      background-color: #ffffff;
    }

    .login-card i {
      font-size: 40px;
      color: #1f4ed8;
      margin-bottom: 15px;
    }

    /* Services Cards */
    .service-card {
      background-color: #fff;
      border-radius: 10px;
      padding: 30px;
      box-shadow: 0 0 10px rgba(0,0,0,0.08);
      text-align: center;
      height: 100%;
    }

    .service-card i {
      font-size: 36px;
      color: #1f4ed8;
      margin-bottom: 15px;
    }

    /* Contact Section */
    .contact-box {
      display: flex;
      flex-wrap: wrap;
      background: #fff;
      padding: 30px;
      box-shadow: 0 0 20px rgba(0,0,0,0.05);
    }

    .contact-left, .contact-right {
      flex: 1;
      min-width: 280px;
      padding: 20px;
    }

    .contact-left h4, .contact-right h4 {
      font-weight: bold;
    }

    .contact-left i {
      color: #1f4ed8;
      font-size: 20px;
      margin-right: 10px;
    }

    .contact-right input, .contact-right textarea {
      width: 100%;
      margin-bottom: 15px;
      padding: 10px;
      border: 1px solid #ACACAC;
    }

    .contact-right button {
      background: #1F3B73;
      color: white;
      border: none;
      padding: 10px 30px;
      font-weight: bold;
    }

    footer {
      background-color: #1f4ed8;
      color: white;
      text-align: center;
      padding: 20px 0;
      margin-top: 40px;
    }

    @media (max-width: 768px) {
      .hero-content h1 {
        font-size: 2.2rem;
      }
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav>
  <div class="logo">
    DIGIHEALTHCARD
    <span>Health Record Wallet</span>
  </div>
  <div class="nav-links">
    <a href="#about">About</a>
    <a href="#services">Services</a>
    <a href="#login">Login</a>
    <a href="#contact">Contact</a>
  </div>
</nav>

<!-- Hero Section -->
<section class="hero-section" id="home">
  <video autoplay muted loop>
    <source src="video/background.mp4" type="video/mp4">
  </video>
  <div class="hero-content">
    <h1>Welcome to DigiHealthCard</h1>
    <p>Your Digital Gateway to Secure and Efficient Healthcare Management</p>
  </div>
</section>

<!-- About Section -->
<section id="about">
  <div class="container">
    <h2>About DigiHealthCard</h2>
    <p class="text-center mb-4">
      DigiHealthCard is a next-generation medical record platform that provides patients and healthcare professionals with a centralized, secure, and digital alternative to paper-based records. Whether you're accessing your prescriptions, scheduling appointments, or viewing your medical history—DigiHealthCard makes it fast and easy.
    </p>
    <div class="row text-center">
      <div class="col-md-4">
        <i class="bi bi-cloud-check" style="font-size:30px; color:#1f4ed8;"></i>
        <h5 class="mt-2">Cloud Storage</h5>
        <p>Your data is safely stored and accessible anywhere, anytime.</p>
      </div>
      <div class="col-md-4">
        <i class="bi bi-shield-lock" style="font-size:30px; color:#1f4ed8;"></i>
        <h5 class="mt-2">Secure Access</h5>
        <p>Advanced encryption keeps your records private and protected.</p>
      </div>
      <div class="col-md-4">
        <i class="bi bi-phone" style="font-size:30px; color:#1f4ed8;"></i>
        <h5 class="mt-2">Mobile Ready</h5>
        <p>Access your health card on any device with a user-friendly interface.</p>
      </div>
    </div>
  </div>
</section>

<!-- Services Section -->
<section id="services" class="bg-white">
  <div class="container">
    <h2>Our Services</h2>
    <div class="row g-4">
      <div class="col-md-4">
        <div class="service-card">
          <i class="bi bi-file-medical"></i>
          <h5>Digital Health Records</h5>
          <p>Maintain comprehensive and up-to-date medical information securely online.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="service-card">
          <i class="bi bi-people"></i>
          <h5>Doctor & Patient Portal</h5>
          <p>Connect with healthcare professionals and manage appointments with ease.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="service-card">
          <i class="bi bi-gear"></i>
          <h5>Admin Control Panel</h5>
          <p>Streamline user management and monitor activity through a secure dashboard.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Login Section -->
<section id="login" class="bg-light">
  <div class="container">
    <h2>Login As</h2>
    <div class="row g-4 justify-content-center mt-4">
      <div class="col-md-3">
        <div class="login-card">
          <i class="bi bi-person-fill"></i>
          <h5>Patient</h5>
          <a href="patientLogin.jsp" class="btn btn-primary mt-2 w-100">Login</a>
        </div>
      </div>
      <div class="col-md-3">
        <div class="login-card">
          <i class="bi bi-heart-pulse"></i>
          <h5>Doctor</h5>
          <a href="doctorLogin.jsp" class="btn btn-primary mt-2 w-100">Login</a>
        </div>
      </div>
      <div class="col-md-3">
        <div class="login-card">
          <i class="bi bi-shield-lock-fill"></i>
          <h5>Admin</h5>
          <a href="adminLogin.jsp" class="btn btn-primary mt-2 w-100">Login</a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Contact Section -->
<section id="contact">
  <div class="container">
    <h2>Contact Us</h2>
    <div class="contact-box">
      <div class="contact-left">
        <h4><i class="bi bi-telephone-fill"></i> CALL US</h4>
        <p>+91 9876543210, +91 9123456789</p>
        <h4 class="mt-4"><i class="bi bi-geo-alt-fill"></i> LOCATION</h4>
        <p>123 Hospital Road, Health City, India</p>
        <h4 class="mt-4"><i class="bi bi-clock-fill"></i> BUSINESS HOURS</h4>
        <p>Mon - Fri: 9:00 AM - 6:00 PM<br>Sat - Sun: Closed</p>
      </div>
      <div class="contact-right">
        <h4>CONTACT US</h4>
        <form>
          <input type="text" placeholder="Enter your Name" required>
          <input type="email" placeholder="Enter a valid email address" required>
          <textarea rows="4" placeholder="Your Message"></textarea>
          <button type="submit">SUBMIT</button>
        </form>
      </div>
    </div>
  </div>
</section>

<footer>
  &copy; 2025 DigiHealthCard. All rights reserved.
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
