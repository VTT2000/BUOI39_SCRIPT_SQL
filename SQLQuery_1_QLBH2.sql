use master
go

use QLBH
GO

DELETE SAN_PHAM

DECLARE @dem int = 0
WHILE (@dem < 20)
BEGIN
    INSERT into SAN_PHAM
    VALUES(N'Bánh bao ' + CONVERT(nvarchar, @dem), 5000)
    SET @dem = @dem + 1;
END

-- -- Tạo bảng phòng ban
-- CREATE TABLE PhongBan (
--     MaPhongBan INT PRIMARY KEY identity,
--     TenPhongBan VARCHAR(100) NOT NULL
-- );

-- -- Tạo bảng nhân viên với khóa ngoại tham chiếu đến bảng phòng ban
-- CREATE TABLE NhanVien (
--     MaNhanVien INT PRIMARY KEY identity,
--     HoTen VARCHAR(100) NOT NULL,
--     NgaySinh DATE NOT NULL,
--     GioiTinh nvarchar(50) NOT NULL,
--     MaPhongBan INT,
--     FOREIGN KEY (MaPhongBan) REFERENCES PhongBan(MaPhongBan)
-- );

-- -- Thêm dữ liệu vào bảng phòng ban
-- INSERT INTO PhongBan (TenPhongBan) VALUES
-- ('Phòng Kỹ Thuật'),
-- ('Phòng Kinh Doanh'),
-- ('Phòng Nhân Sự');

-- -- Thêm 20 nhân viên vào bảng nhân viên
-- INSERT INTO NhanVien (HoTen, NgaySinh, GioiTinh, MaPhongBan) VALUES
-- ('Nguyễn Văn A', '1990-05-10', 'Nam', 1),
-- ('Trần Thị B', '1992-07-15', 'Nữ', 2),
-- ('Lê Văn C', '1985-12-20', 'Nam', 3),
-- ('Phạm Thị D', '1993-04-03', 'Nữ', 1),
-- ('Hoàng Văn E', '1988-09-30', 'Nam', 2),
-- ('Võ Thị F', '1995-02-14', 'Nữ', 3),
-- ('Bùi Văn G', '1991-06-25', 'Nam', 1),
-- ('Đỗ Thị H', '1994-11-11', 'Nữ', 2),
-- ('Ngô Văn I', '1987-08-19', 'Nam', 3),
-- ('Dương Thị J', '1996-01-23', 'Nữ', 1),
-- ('Cao Văn K', '1993-03-17', 'Nam', 2),
-- ('Lý Thị L', '1990-10-08', 'Nữ', 3),
-- ('Tạ Văn M', '1986-05-29', 'Nam', 1),
-- ('Hồ Thị N', '1997-12-02', 'Nữ', 2),
-- ('Khương Văn O', '1989-07-22', 'Nam', 3),
-- ('Văn Thị P', '1992-09-14', 'Nữ', 1),
-- ('Trịnh Văn Q', '1995-06-05', 'Nam', 2),
-- ('Hứa Thị R', '1991-11-27', 'Nữ', 3),
-- ('Kiều Văn S', '1988-04-12', 'Nam', 1),
-- ('Phùng Thị T', '1993-08-09', 'Nữ', 2);


-- select *
-- from SAN_PHAM

-- update SAN_PHAM set gia = 9000 where id = 7 /* đổi do identity tự động tăng */
-- select * from SAN_PHAM

-- update SAN_PHAM set gia = gia + gia * 20 / 100 where id % 2 = 0
-- select * from SAN_PHAM

-- DECLARE @chietkhau float = 0.2
-- update SAN_PHAM set gia = gia + gia * @chietkhau where id % 2 = 0
-- select * from SAN_PHAM

-- Delete SAN_PHAM where id = 18 /* đổi do identity tự động tăng */
-- select * from SAN_PHAM

-- select * from SAN_PHAM
-- select id as 'Mã sản phẩm', ten as 'Tên sản phẩm', gia as 'Giá bán' from SAN_PHAM
-- where ten like N'%n'

-- BEGIN TRANSACTION
-- BEGIN TRY
--     -- các thay đổi insert update delete
--     COMMIT
-- END TRY
-- BEGIN CATCH
--     ROLLBACK
-- END CATCH

-- BEGIN TRANSACTION
-- BEGIN TRY
--     SAVE TRANSACTION T1
--     -- các thay đổi insert update delete điểm T1
--     SAVE TRANSACTION T2
--     -- các thay đổi insert update delete điểm T2
--     COMMIT
-- END TRY
-- BEGIN CATCH
--     ROLLBACK TRANSACTION T1 -- Trở về điểm save T1
-- END CATCH

-- select * from SAN_PHAM
-- select * from SAN_PHAM ORDER BY gia DESC

-- SELECT * from SAN_PHAM 
-- DECLARE @pageSize int = 8
-- DECLARE @pageIndex int = 2
-- DECLARE @pageCount int = (SELECT COUNT(1) FROM SAN_PHAM)/@pageSize + 1
-- SELECT * from SAN_PHAM ORDER BY id OFFSET (@pageIndex-1)*@pageSize ROWS FETCH NEXT @pageSize ROW ONLY
-- SELECT CONVERT(varchar, @pageIndex) + '/' + CONVERT(varchar, @pageCount) as 'PAGE'

/* group by where 2 bảng from a, b */

-- select Count(*), a.idGO, (
--         select *
--     from T1 as b
--     where b.idGO = a.idGO
--     for json path -- dữ liệu dạng json
--     ) as ThongTin
-- from T1 as a
-- Where
-- group by a.idGO
-- Having a.giatriT <> 10 --điều kiện sau khi gôm nhóm group by


-- GO
-- -- Create a new stored procedure called 'StoredProcedureName' in schema 'dbo'
-- -- Drop the stored procedure if it already exists
-- IF EXISTS (
-- SELECT *
--     FROM INFORMATION_SCHEMA.ROUTINES
-- WHERE SPECIFIC_SCHEMA = N'dbo'
--     AND SPECIFIC_NAME = N'SELECT_TABLE'
--     AND ROUTINE_TYPE = N'PROCEDURE'
-- )
-- DROP PROCEDURE dbo.SELECT_TABLE
-- GO
-- -- Create the stored procedure in the specified schema
-- CREATE PROCEDURE dbo.SELECT_TABLE
--     @tableName nvarchar(50)
-- AS
-- BEGIN
--     SET NOCOUNT ON;

--     -- Tạo câu lệnh SQL động một cách an toàn
--     DECLARE @sql NVARCHAR(MAX);
--     SET @sql = N'SELECT * FROM ' + QUOTENAME(@tableName);

--     -- Thực thi SQL động
--     EXEC sp_executesql @sql;
-- END
-- GO

-- -- example to execute the stored procedure we just created
-- EXECUTE dbo.SELECT_TABLE 'SAN_PHAM'
-- GO





