--1. Tìm doanh thu bán hàng của các năm
SELECT YEAR(NGHD) AS Nam, SUM(TRIGIA) AS DoanhThu
FROM HOADON
GROUP BY YEAR(NGHD)
ORDER BY Nam

--2.Tính doanh thu bán hàng theo tháng
SELECT MONTH(NGHD) AS Thang, SUM(TRIGIA) AS DoanhThuThang, YEAR(NGHD) AS Nam
FROM HOADON
GROUP BY YEAR(NGHD), MONTH(NGHD)
ORDER BY Nam, Thang

--3. Hãy liệt kê những khách (MAKH, HOTEN) đã mua hàng trong năm 2007
--và có giá trị hóa đơn >=1.000.000
SELECT DISTINCT KH.MAKH, KH.HOTEN
FROM KHACHHANG KH
JOIN HOADON HD ON KH.MAKH=HD.MAKH
WHERE YEAR(HD.NGHD)=2007 AND HD.TRIGIA >=100000

--4. Tìm hóa đơn mua ít nhất 3 sản phẩm
SELECT SOHD, COUNT(MASP) AS SoSP
FROM CTHD
GROUP BY SOHD
HAVING COUNT(MASP)>=3
