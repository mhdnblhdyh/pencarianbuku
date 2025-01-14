<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web Perpustakaan Sederhana</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <header>
        <h1>Web Perpustakaan Sederhana</h1>
        <form method="GET" action="index.php">
            <input type="text" name="keyword" placeholder="Ketik kata kunci buku..." class="search-input">
            <button type="submit" class="search-button">Cari</button>
            <select name="kategori" class="category-select">
                <option value="">Pilih Kategori</option>
                <?php
                // Mengambil kategori dari database
                $conn = new mysqli('localhost', 'root', '', 'perpustakaan');
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                $sql = "SELECT DISTINCT kategori FROM buku";
                $result = $conn->query($sql);
                
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<option value='" . $row['kategori'] . "'>" . ucfirst($row['kategori']) . "</option>";
                    }
                }
                $conn->close();
                ?>
            </select>
        </form>
    </header>

    <main>
        <div class="banner">
            <h2>Hasil Pencarian</h2>
        </div>
        
        <section class="books">
            <?php
            if (isset($_GET['keyword']) && !empty($_GET['keyword'])) {
                $keyword = $_GET['keyword'];
                $kategori = isset($_GET['kategori']) ? $_GET['kategori'] : ''; // Menangani kemungkinan tidak ada nilai kategori
                searchBooks($keyword, $kategori);
                displayRecommendations($keyword, $kategori);
            } else {
                echo "Masukkan kata kunci untuk mencari buku.";
            }

            function searchBooks($keyword, $kategori) {
                $conn = new mysqli('localhost', 'root', '', 'perpustakaan');
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                // Query untuk mencari buku berdasarkan keyword dan kategori
                $sql = "SELECT * FROM buku WHERE (judul LIKE '%$keyword%' OR sinopsis LIKE '%$keyword%')";
                if (!empty($kategori)) {
                    $sql .= " AND kategori = '$kategori'";
                }
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<div class='book'>";
                        echo "<img src='images/" . $row['gambar'] . "' alt='" . $row['judul'] . "'>";
                        echo "<h3>" . $row['judul'] . "</h3>";
                        echo "<p>Penerbit: " . $row['penerbit'] . "</p>";
                        echo "<p>Pencipta: " . $row['pencipta'] . "</p>";
                        echo "<p>Tahun Terbit: " . $row['tahun_terbit'] . "</p>";
                        echo "<p>Jumlah Halaman: " . $row['jumlah_halaman'] . "</p>";
                        echo "<p>Sinopsis: " . $row['sinopsis'] . "</p>";
                        echo "</div>";
                    }
                } else {
                    echo "Buku tidak ditemukan.";
                }

                $conn->close();
            }

            function displayRecommendations($keyword, $kategori) {
                $conn = new mysqli('localhost', 'root', '', 'perpustakaan');
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                // Query untuk mengambil buku rekomendasi berdasarkan kategori
                $sql = "SELECT * FROM buku WHERE kategori = '$kategori' AND judul != '$keyword' ORDER BY RAND() LIMIT 5";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    echo "<h2>Rekomendasi Buku</h2>";
                    echo "<div class='recommendations'>";
                    while ($row = $result->fetch_assoc()) {
                        echo "<div class='book'>";
                        echo "<img src='images/" . $row['gambar'] . "' alt='" . $row['judul'] . "'>";
                        echo "<h3>" . $row['judul'] . "</h3>";
                        echo "<p>Penerbit: " . $row['penerbit'] . "</p>";
                        echo "<p>Pencipta: " . $row['pencipta'] . "</p>";
                        echo "<p>Tahun Terbit: " . $row['tahun_terbit'] . "</p>";
                        echo "<p>Jumlah Halaman: " . $row['jumlah_halaman'] . "</p>";
                        echo "<p>Sinopsis: " . $row['sinopsis'] . "</p>";
                        echo "</div>";
                    }
                    echo "</div>";
                } else {
                    echo "Rekomendasi buku tidak ditemukan.";
                }

                $conn->close();
            }
            ?>
        </section>
    </main>

</body>
</html>
