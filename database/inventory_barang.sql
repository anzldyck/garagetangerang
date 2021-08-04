-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jun 2019 pada 05.10
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_barang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `kd_admin` int(6) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `gambar` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`kd_admin`, `nama`, `email`, `password`, `gambar`) VALUES
(5, 'Angga Maulana', 'angga31@gmail.com', 'angga', 'download (5).jpg'),
(6, 'admin', 'admin@admin.com', 'admin', 'brand_logo_fvym9h2v2ke3.png'),
(7, 'Nur Tri ', 'nurtriastuti@gmail.com', 'nurtri', '9.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kd_barang` varchar(8) NOT NULL,
  `nama_barang` varchar(60) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `harga_jual` int(15) NOT NULL,
  `harga_beli` int(15) NOT NULL,
  `stok` int(4) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`kd_barang`, `nama_barang`, `satuan`, `harga_jual`, `harga_beli`, `stok`, `status`) VALUES
('BB000001', 'Acne Care Loose Foundation', 'PCS', 80000, 40000, 48, '0'),
('BB000003', '3 Colors Eye Shadow', 'PCS', 45000, 20000, 25, '0'),
('MB00001', 'Age Defying Serum', 'PCS', 46000, 22000, 33, '0'),
('MB00003', 'Brightening Face Serum Pelembab Wajah', 'PCS', 96000, 50000, 100, '0'),
('MB00004', 'Acne Care Face Mist', 'PCS', 46000, 12000, 53, '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barangp_sementara`
--

CREATE TABLE `barangp_sementara` (
  `id_barangp` int(6) NOT NULL,
  `kd_pembelian` char(8) NOT NULL,
  `nama_barangp` varchar(225) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `harga_barangp` double NOT NULL,
  `item` int(4) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_pembelian`
--

CREATE TABLE `barang_pembelian` (
  `kd_barang_beli` int(6) NOT NULL,
  `kd_pembelian` char(8) NOT NULL,
  `nama_barang_beli` varchar(225) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `harga_beli` double NOT NULL,
  `item` int(4) NOT NULL,
  `total` double NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang_pembelian`
--

INSERT INTO `barang_pembelian` (`kd_barang_beli`, `kd_pembelian`, `nama_barang_beli`, `satuan`, `harga_beli`, `item`, `total`, `status`) VALUES
(108, 'PEM00001', 'Dancing Rain Body Scrub', 'PCS', 21000, 1000, 21000000, '0'),
(109, 'PEM00002', 'Age Defying Cleansing Milk Lotion', 'PCS', 20000, 860, 17200000, '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `d_pembelian`
--

CREATE TABLE `d_pembelian` (
  `id_pembelian` int(6) NOT NULL,
  `kd_pembelian` char(8) NOT NULL,
  `kd_barang_beli` int(6) NOT NULL,
  `jumlah` int(6) NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `d_pembelian`
--

INSERT INTO `d_pembelian` (`id_pembelian`, `kd_pembelian`, `kd_barang_beli`, `jumlah`, `subtotal`) VALUES
(161, 'PEM00001', 108, 1000, 21000000),
(162, 'PEM00002', 109, 860, 17200000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `d_penjualan`
--

CREATE TABLE `d_penjualan` (
  `id_penjualan` int(6) NOT NULL,
  `kd_penjualan` char(8) NOT NULL,
  `kd_barang` varchar(8) NOT NULL,
  `jumlah` int(4) NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `d_penjualan`
--

INSERT INTO `d_penjualan` (`id_penjualan`, `kd_penjualan`, `kd_barang`, `jumlah`, `subtotal`) VALUES
(55, 'PEN00001', 'BB000003', 5, 2250000),
(56, 'PEN00002', 'BB000001', 2, 400000),
(57, 'PEN00003', 'BB000003', 50, 2250000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `kd_pembelian` char(8) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `kd_admin` int(6) NOT NULL,
  `kd_supplier` int(6) NOT NULL,
  `total_pembelian` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`kd_pembelian`, `tgl_pembelian`, `kd_admin`, `kd_supplier`, `total_pembelian`) VALUES
('PEM00001', '2019-06-23', 6, 1, 21000000),
('PEM00002', '2019-04-23', 6, 3, 17200000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `kd_penjualan` char(8) NOT NULL,
  `tgl_penjualan` date NOT NULL,
  `kd_admin` int(6) NOT NULL,
  `dibayar` double NOT NULL,
  `total_penjualan` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`kd_penjualan`, `tgl_penjualan`, `kd_admin`, `dibayar`, `total_penjualan`) VALUES
('PEN00001', '2016-03-13', 6, 2260000, 2250000),
('PEN00002', '2019-06-23', 6, 680000, 400000),
('PEN00003', '2019-06-24', 6, 2250000, 2250000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_sementara`
--

CREATE TABLE `penjualan_sementara` (
  `id_penjualan_sementara` int(11) NOT NULL,
  `kd_penjualan` char(8) NOT NULL,
  `kd_barang` varchar(8) NOT NULL,
  `nama_barang` varchar(225) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `harga` double NOT NULL,
  `item` int(4) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `perusahaan`
--

CREATE TABLE `perusahaan` (
  `kd_perusahaan` int(11) NOT NULL,
  `nama_perusahaan` varchar(225) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `pemilik` varchar(225) NOT NULL,
  `kota` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `perusahaan`
--

INSERT INTO `perusahaan` (`kd_perusahaan`, `nama_perusahaan`, `alamat`, `pemilik`, `kota`) VALUES
(1, 'PT MICA JAYA PRATAMA', 'Jl. Kencana Raya No.22, Ciater, Kec. Serpong, Kota Tangerang Selatan, Banten 15310', 'Rizka Dwi Saputra', 'Tangerang Selatan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `kd_supplier` int(6) NOT NULL,
  `nama_supplier` varchar(60) NOT NULL,
  `alamat` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`kd_supplier`, `nama_supplier`, `alamat`) VALUES
(1, 'PT Aman Sejahtera', 'Condong catur, sleman'),
(3, 'PT Maju Jaya ', 'Kuningan, Bandung Barat Selatan Ke Utara'),
(4, 'PT Jaya Baya', 'Karawang');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`kd_admin`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indeks untuk tabel `barangp_sementara`
--
ALTER TABLE `barangp_sementara`
  ADD PRIMARY KEY (`id_barangp`),
  ADD KEY `kd_pembelian` (`kd_pembelian`);

--
-- Indeks untuk tabel `barang_pembelian`
--
ALTER TABLE `barang_pembelian`
  ADD PRIMARY KEY (`kd_barang_beli`);

--
-- Indeks untuk tabel `d_pembelian`
--
ALTER TABLE `d_pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `kd_pembelian` (`kd_pembelian`),
  ADD KEY `kd_pembelian_2` (`kd_pembelian`),
  ADD KEY `kd_barang_beli` (`kd_barang_beli`),
  ADD KEY `kd_barang_beli_2` (`kd_barang_beli`);

--
-- Indeks untuk tabel `d_penjualan`
--
ALTER TABLE `d_penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `kd_penjualan` (`kd_penjualan`),
  ADD KEY `kd_barang` (`kd_barang`),
  ADD KEY `kd_barang_2` (`kd_barang`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`kd_pembelian`),
  ADD KEY `kd_admin` (`kd_admin`),
  ADD KEY `kd_supplier` (`kd_supplier`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`kd_penjualan`),
  ADD KEY `kd_admin` (`kd_admin`);

--
-- Indeks untuk tabel `penjualan_sementara`
--
ALTER TABLE `penjualan_sementara`
  ADD PRIMARY KEY (`id_penjualan_sementara`);

--
-- Indeks untuk tabel `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`kd_perusahaan`),
  ADD KEY `kd_perusahaan` (`kd_perusahaan`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`kd_supplier`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `kd_admin` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `barangp_sementara`
--
ALTER TABLE `barangp_sementara`
  MODIFY `id_barangp` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `barang_pembelian`
--
ALTER TABLE `barang_pembelian`
  MODIFY `kd_barang_beli` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT untuk tabel `d_pembelian`
--
ALTER TABLE `d_pembelian`
  MODIFY `id_pembelian` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT untuk tabel `d_penjualan`
--
ALTER TABLE `d_penjualan`
  MODIFY `id_penjualan` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `penjualan_sementara`
--
ALTER TABLE `penjualan_sementara`
  MODIFY `id_penjualan_sementara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `perusahaan`
--
ALTER TABLE `perusahaan`
  MODIFY `kd_perusahaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `kd_supplier` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `d_pembelian`
--
ALTER TABLE `d_pembelian`
  ADD CONSTRAINT `d_pembelian_ibfk_3` FOREIGN KEY (`kd_pembelian`) REFERENCES `pembelian` (`kd_pembelian`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `d_pembelian_ibfk_4` FOREIGN KEY (`kd_barang_beli`) REFERENCES `barang_pembelian` (`kd_barang_beli`);

--
-- Ketidakleluasaan untuk tabel `d_penjualan`
--
ALTER TABLE `d_penjualan`
  ADD CONSTRAINT `d_penjualan_ibfk_3` FOREIGN KEY (`kd_barang`) REFERENCES `barang` (`kd_barang`),
  ADD CONSTRAINT `d_penjualan_ibfk_4` FOREIGN KEY (`kd_penjualan`) REFERENCES `penjualan` (`kd_penjualan`);

--
-- Ketidakleluasaan untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`kd_supplier`) REFERENCES `supplier` (`kd_supplier`),
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`kd_admin`) REFERENCES `admin` (`kd_admin`);

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`kd_admin`) REFERENCES `admin` (`kd_admin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
