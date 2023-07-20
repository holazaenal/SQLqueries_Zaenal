--BUAT TABLE 
CREATE TABLE family_tree(
	silsilah_id INTEGER NOT NULL PRIMARY KEY,
	parent_id INTEGER,
	nama VARCHAR(30),
	jenis_kelamin VARCHAR(10)
	CONSTRAINT cekJenisKelamin CHECK(jenis_kelamin = 'laki-laki' or jenis_kelamin = 'perempuan')
) 

--INSERT DATA TABLE
INSERT INTO family_tree VALUES
(001, null, 'Budi', 'laki-laki'),
(002, 001, 'Dedi', 'laki-laki'),
(003, 001, 'Dodi', 'laki-laki'),
(004, 001, 'Dede', 'laki-laki'),
(005, 001, 'Dewi', 'perempuan'),
(006, 002, 'Feri', 'laki-laki'),
(007, 002, 'Farah', 'perempuan'),
(008, 003, 'Gugus', 'laki-laki'),
(009, 003, 'Gandi', 'laki-laki'),
(010, 004, 'Hani', 'perempuan'),
(011, 004, 'Hana', 'perempuan')


--CEK DATA TABLE
SELECT * FROM family_tree

--DATA ANAK DEDI
SELECT nama, jenis_kelamin 
FROM family_tree
WHERE parent_id = 
(SELECT silsilah_id
FROM family_tree
WHERE nama = 'Dedi')

--DATA CUCU BUDI
SELECT nama, jenis_kelamin 
FROM family_tree
WHERE parent_id IN 
(SELECT silsilah_id
FROM family_tree
WHERE parent_id = 
(SELECT silsilah_id
FROM family_tree
WHERE nama = 'Budi'))


--DATA CUCU Perempuan BUDI
SELECT nama, jenis_kelamin 
FROM family_tree
WHERE parent_id IN 
(SELECT silsilah_id
FROM family_tree
WHERE parent_id = 
(SELECT silsilah_id
FROM family_tree
WHERE nama = 'Budi')) AND jenis_kelamin='perempuan' 

--DATA CUCU Lakilaki Budi
SELECT nama, jenis_kelamin 
FROM family_tree
WHERE parent_id IN 
(SELECT silsilah_id
FROM family_tree
WHERE parent_id = 
(SELECT silsilah_id
FROM family_tree
WHERE nama = 'Budi')) AND jenis_kelamin = 'laki-laki'

