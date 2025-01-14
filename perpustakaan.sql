-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2025 at 02:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `pencipta` varchar(255) NOT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `jumlah_halaman` int(11) NOT NULL,
  `sinopsis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `judul`, `kategori`, `gambar`, `penerbit`, `pencipta`, `tahun_terbit`, `jumlah_halaman`, `sinopsis`) VALUES
(1, 'Naruto', 'Komik', 'naruto.jpg', 'Shonen Jump', 'Masashi Kishimoto', '1999', 220, 'Naruto Uzumaki is a young ninja with a dream of becoming the strongest ninja in his village.'),
(2, 'One Piece', 'Komik', 'onepiece.jpg', 'Shonen Jump', 'Eiichiro Oda', '1997', 199, 'The adventures of Monkey D. Luffy and his pirate crew in the Grand Line.'),
(3, 'Harry Potter', 'Novel', 'harrypotter.jpg', 'Bloomsbury', 'J.K. Rowling', '1997', 223, 'A young wizard embarks on a journey to find his place in the magical world.'),
(4, 'To Kill a Mockingbird', 'Novel', 'mockingbird.jpg', 'J.B. Lippincott & Co.', 'Harper Lee', '1960', 281, 'A story of racial injustice in the Deep South during the 1930s.'),
(5, 'Percy Jackson', 'Novel', 'percyjackson.jpg', 'Disney Hyperion', 'Rick Riordan', '2005', 377, 'A young demigod embarks on an epic adventure to save the world from the wrath of the Titans.'),
(6, 'Senja, Hujan, & Cerita yang Telah Usai', 'Novel', 'senja_hujan.jpg', 'Gramedia Pustaka Utama', 'Boy Candra', '2015', 200, 'Buku ini menceritakan pengalaman pribadi penulis dalam perjalanan asmaranya. Buku ini dipersembahkan untuk orang-orang yang pernah dilukai, mencintai, atau dikhianati, serta bagi mereka yang pernah mengkhianati lalu menyadari kesalahannya. Buku ini juga mengajak pembaca untuk mengenang masa lalu, namun tidak lupa untuk move on dan menata rindu yang baru.'),
(7, 'Pemrograman Web dengan PHP dan MySQL', 'Komputer', 'php_mysql.jpg', 'Andi Publisher', 'Dian Haryanto', '2018', 450, 'Buku ini membahas dasar-dasar pemrograman web menggunakan PHP dan MySQL, termasuk teknik pembuatan aplikasi web yang dinamis.'),
(8, 'Algoritma dan Struktur Data', 'Komputer', 'algoritma_struktur_data.jpg', 'Erlangga', 'Dr. Rinaldi Munir', '2017', 320, 'Buku ini memberikan penjelasan mendalam tentang algoritma dan struktur data dengan contoh implementasi dalam berbagai bahasa pemrograman.'),
(9, 'Belajar Jaringan Komputer', 'Komputer', 'jaringan_komputer.jpg', 'Informatika', 'Andrew S. Tanenbaum', '2015', 600, 'Buku ini membahas konsep dasar dan lanjutan tentang jaringan komputer, mulai dari protokol hingga aplikasi.'),
(10, 'Artificial Intelligence: Dasar dan Implementasi', 'Komputer', 'ai_dasar.jpg', 'Gramedia', 'Russell & Norvig', '2016', 750, 'Buku ini adalah pengantar ke dunia kecerdasan buatan, dengan teori dan implementasi menggunakan teknologi modern.'),
(11, 'Desain Grafis dengan Adobe Photoshop', 'Komputer', 'photoshop.jpg', 'Elex Media Komputindo', 'Heru Susanto', '2019', 250, 'Panduan praktis untuk belajar desain grafis menggunakan Adobe Photoshop, mulai dari dasar hingga teknik tingkat lanjut.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
