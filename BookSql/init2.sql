use `freedb_jewelry-kathon`;
SELECT VERSION();
SET FOREIGN_KEY_CHECKS=0;
CREATE TABLE user(
	Id VARCHAR(100) PRIMARY KEY,
    Username VARCHAR(45) NOT NULL,
    Email VARCHAR(45) NOT NULL,
    Password_Hashed VARCHAR(100) NOT NULL,
	Email_Token VARCHAR(45) NOT NULL,
    IsActive INT NOT NULL,
    Avatar VARCHAR(1024),
    Role INT NOT NULL,
    Address VARCHAR(100),
    Phone VARCHAR(20),
    Create_At VARCHAR(30) NOT NULL
);

create table Collections(
	IdColl int primary key auto_increment,
    CollName varchar(300) not null unique,
    CollImage varchar(200) not null
);

create table JewelryType(
	IdType int primary key auto_increment,
    TypeName varchar(300) not null unique,
    TypeImage varchar(200) not null
);

CREATE TABLE Jewelry(
	IdJewelry VARCHAR(100) primary key,
    IdColl int not null,
    IdType int not null,
    JewName varchar(300) not null unique,
    JewPrice int not null,
    JewDes varchar(300) not null,
    FOREIGN KEY (IdColl) REFERENCES Collections(IdColl),
    FOREIGN KEY (IdType) REFERENCES JewelryType(IdType)
);

CREATE TABLE JewelryImage(
	IdImage VARCHAR(100) primary key,
    IdJewelry varchar(100) not null,
    PathImage varchar(200) not null,
    FOREIGN KEY (IdJewelry) REFERENCES Jewelry(IdJewelry)
);

/*CREATE TABLE Ring(
	IdRing varchar(100) primary key,
    IdJewelry varchar(100) not null,-- 
    Size varchar(10) not null,
    Material varchar(100) not null,
    Quantity int not null,
    FOREIGN KEY (IdJewelry) REFERENCES Jewelry(IdJewelry)
);*/
CREATE TABLE Ring(
	IdRing varchar(100) primary key,
    IdJewelry varchar(100) not null,
    Size varchar(10) not null,
    Material varchar(100) not null,
    Quantity int not null,
    FOREIGN KEY (IdJewelry) REFERENCES Jewelry(IdJewelry)
);

CREATE TABLE Glasses(
	IdGlasses varchar(100) primary key,
    IdJewelry varchar(100) not null,
    Material varchar(100) not null,
    Quantity int not null,
    FOREIGN KEY (IdJewelry) REFERENCES Jewelry(IdJewelry)
);

CREATE TABLE Necklace(
	IdNecklace varchar(100) primary key,
    IdJewelry varchar(100) not null,
    Material varchar(100) not null,
    Quantity int not null,
    FOREIGN KEY (IdJewelry) REFERENCES Jewelry(IdJewelry)
);

CREATE TABLE Bracelet(
	IdBracelet varchar(100) primary key,
    IdJewelry varchar(100) not null,
    Material varchar(100) not null,
    Quantity int not null,
    FOREIGN KEY (IdJewelry) REFERENCES Jewelry(IdJewelry)
);

CREATE TABLE Earrings(
	IdEarring varchar(100) primary key,
    IdJewelry varchar(100) not null,
	Size varchar(10) not null,
    Material varchar(100) not null,
    Quantity int not null,
    FOREIGN KEY (IdJewelry) REFERENCES Jewelry(IdJewelry)
);

INSERT INTO Collections (CollName, CollImage)
VALUES
  ('Glints - Crack', "/images/750x950_JH20CFGX_08032022002600.jpg"),
  ('Baroque', "/images/750x950_XPEWSCT5_08032022002344.jpg"),
  ('Bloody Hearts', "/images/750x950_MR1QP8FH_08032022002159.jpg"),
  ('Lauris', "/images/750x950_UIL6C6F4_08032022002927.jpg"),
  ('Fenix', "/images/750x950_UIL6C6F4_08032022002927.jpg"),
  ('Flower', "/images/750x950_JH20CFGX_08032022002600.jpg");

INSERT INTO JewelryType (TypeName, TypeImage)
VALUES
  ('Ring', "https://cdn.tranduythien.net/file/63b4180aa55eb051ce25d197"),
  ('Glasses', "https://cdn.tranduythien.net/file/63b41821a55eb051ce25d198"),
  ('Necklace', "https://cdn.tranduythien.net/file/63b4182f32013aa6a1382ae6"),
  ('Bracelet', "https://cdn.tranduythien.net/file/63b41842a55eb051ce25d199"),
  ('Earrings', "https://cdn.tranduythien.net/file/63b4185a32013aa6a1382ae7");
  
INSERT INTO `Jewelry` VALUES ('01820d3f-e566-424c-99cb-2620db9ccc5c',1,3,'GLINTS F Necklace',3200000,'1 sản phẩm được sử dụng hoạ tiết đặc trưng của collection GLINTS trong từng chi tiết, Nhưng mắt xen kẽ đều là họa tiết tia sáng . Dây chuyền GLINTS F được đính kèm 1 logo brand ở cạnh khóa'),('0c6e90f6-4ba7-4efb-ac88-915b4bf1b7eb',2,1,'BAROQUE RING',1800000,'Được đặt tên theo barroco – một cụm từ trong tiếng Bồ Đào Nha chỉ những viên ngọc trai với hình dáng lạ kỳ. Nếu như trong giai đoạn trước đó của nghệ thuật thời kỳ Phục Hưng là những trật tự và ổn định với những chuẩn mực của Hy Lạp và La Mã cổ đại'),('13a8d87f-05ef-488b-a512-10bfefd532f1',2,4,'BAROQUE Bracelet',2800000,'Lấy ý tưởng về các họa tiết theo chủ đề Phục hưng Ý ( renaissance ) được thiết kế kết hợp giữa chủ nghĩa hiện đại, sang trọng và chủ nghĩa Baroque mềm mại, bay bổng.'),('394d060c-83d4-481b-be12-3a0455c91944',1,3,'GLINTS necklace',3200000,'Kim cương không tự phát sáng nhưng luôn là thứ lấp lánh nhất, Nằm sâu trong lòng đất mẹ, được hình thành sau hàng triệu năm áp lực để tạo lên thứ ánh sáng kì diệu khi có sự phản chiếu, GLINTS necklace'),('3e682476-dc37-4104-bed9-51b5f33e88c9',1,3,'GLINTS Pendant',1450000,'Ánh sáng #GLINTS Là sự phản chiếu diệu kì của những viên Kim Cương ẩn mình sau những lớp đả sỏi sau hàng triệu năm từ những [ CRACK ].'),('52ccde3f-d831-4594-8f1c-1c6bd8a3b75a',1,5,'GLINTS Earring',800000,'Tia sáng lấp lánh được phản chiếu qua những viên kim cương là niềm cả hứng cho bộ sưu tập GLINTS và Earring là 1 trong số đó'),('55d9e7a2-a445-448e-b011-5879d4444afe',6,4,'FLOWER S Bracelet',2500000,'FLower là collection gần như khởi đầu của thương hiệu RIVERBURN, được lấy cảm hứng từ họa tiết hoa daisy và cũng chính là khởi đầu của logo,  Sản phẩm Flower bracelet là 1 trong những sản phẩm được đính nhiều đá cũng như kì công nhất từ khi thương hiệu bắt đầu'),('6e274cc3-9529-4d9e-a5f3-62d573a0fa4a',6,1,'FLOWER Ring',1800000,'NaN'),('6e51085d-8c42-4419-b893-d928196e05e6',6,4,'FLOWER BRACELET',2500000,'FLOWER EMERALD Bracelet - Giá trị đến từng mm,  Hoạ tiết daisy brand được thiết kế đan xen tạo sự khắn khít tinh thế trong từng mắt flower,  100 viên đá được gắn hoàn toàn bằng kính hiển vi với ~ 30 giờ làm việc liên tục của 1 nghệ nhân lành nghề'),('74b74107-1e3d-4110-90e4-dd2a5406dbce',1,5,'BAROQUE Earrings',700000,'Lấy ý tưởng về các họa tiết theo chủ đề Phục hưng Ý ( renaissance ) được thiết kế kết hợp giữa chủ nghĩa hiện đại, sang trọng và chủ nghĩa Baroque mềm mại, bay bổng.'),('756b9f27-6ea1-46a6-b926-b6eacbf00e40',1,1,'BLOODYHEARTS Ring',1500000,'Ring #BLOODYHEARTS được thiết kế và gia công hoàn toàn bằng tay đến từng chi tiết, họa tiết cánh hoa chảy máu được đưa ra xen kẽ từ nụ hoa ra đến tận bên ngoài như những cánh hoa Huyết Tâm.'),('77e11836-2e7a-4417-bf18-ba2e8c9dbb19',2,2,'BAROQUE Glassese',2800000,'Gọng kính với thiết kế đường nét hiện đại, thanh lịch kết hợp với những đường cong uốn lượn bay bổng của họa tiết Baroque, mang đến một ánh nhìn vừa hiện đại, sang trọng và tinh xảo.'),('87efb589-3e7b-4138-ae30-e0d4c7925f60',4,3,'LAURIS NECKLACE',1800000,'NaN'),('9e06d88e-9bc3-478e-8d98-9fd1ab07617a',2,3,'BAROQUE NECKLACE',2800000,'Được đặt tên theo barroco – một cụm từ trong tiếng Bồ Đào Nha chỉ những viên ngọc trai với hình dáng lạ kỳ. Nếu như trong giai đoạn trước đó của nghệ thuật thời kỳ Phục Hưng là những trật tự và ổn định với những chuẩn mực của Hy Lạp và La Mã cổ đại'),('aaaa71c3-39d9-4149-ad5c-a89160a2de3e',1,3,'BLOODYHEARTS Necklace',2800000,'BLOODYHEARTS collection đã ra mắt được 2 năm, được biết đến với 2 sản phẩm Kính và Nhẫn. Được lấy cảm hứng từ loài hoa Huyết Tâm - loài hoa có vẻ đẹp mĩ miều nhưng đi kèm với câu chuyện đau thương khi có hình dạng như trái tim đang rỉ máu.'),('aebe7d1d-28cf-4470-9e14-8d02719cc39f',4,1,'LAURIS Ring',1400000,'#?????? ring là 1 sản phẩm được lấy cảm hứng từ loài hoa nguyệt quế, thể hiện sự vinh quang, chiến thắng.'),('b10b42f3-1635-4f11-a479-f4ccf152797c',6,1,'FLOWER DIG',900000,'NaN'),('c5723719-2959-411f-84b2-1dbdda3e1b35',2,1,'Baroque Ring - Natural Gem Stone',2500000,'Được đặt tên theo barroco – một cụm từ trong tiếng Bồ Đào Nha chỉ những viên ngọc trai với hình dáng lạ kỳ. Nếu như trong giai đoạn trước đó của nghệ thuật thời kỳ Phục Hưng là những trật tự và ổn định với những chuẩn mực của Hy Lạp và La Mã cổ đại'),('d83a7a9e-85d6-4c76-b1d5-c2bd7d9fc12b',1,4,'GLINTS Bracelet',2800000,'Kim cương không tự phát sáng nhưng luôn là thứ lấp lánh nhất, Nằm sâu trong lòng đất mẹ, được hình thành sau hàng triệu năm áp lực để tạo lên thứ ánh sáng kì diệu khi có sự phản chiếu, GLINTS necklace'),('f7049fb0-13bb-4e8a-9d4c-8c94577ae146',4,3,'LAURIS PEDANT',1350000,'NaN'),('ff4d532b-0863-4c3a-823a-8fb1356fa6d2',1,1,'CRACK RING',635000,'Nằm sâu trong lòng đất mẹ, lẫn lộn trong vô vàn đá sỏi, được hình thành sau hàng triệu năm áp lực.  Chúng trồi lên trên vỏ trái đất nhờ tác động của núi lửa phun trào, với hình hài thô ráp ẩn mình sau những cục đá nứt nẻ [ CRACK ].');

INSERT INTO `JewelryImage` VALUES ('0005b6e2-59c2-441b-bf1c-07d82266c909','3e682476-dc37-4104-bed9-51b5f33e88c9','images/650x650_KPFYF1Q0_03122022135709.jpg'),('00772562-b81a-4d70-a1f5-377d58a8429d','55d9e7a2-a445-448e-b011-5879d4444afe','images/650x650_J50J90YP_27052022173451.JPG'),('0320a6af-83fa-4a75-b740-ba2d17c1d634','74b74107-1e3d-4110-90e4-dd2a5406dbce','images/650x650_4Y3MLIG1_09062023113351.png'),('0489b3af-0645-4251-bb57-b790bb1f0d5f','d83a7a9e-85d6-4c76-b1d5-c2bd7d9fc12b','images/650x650_SD5K8HUS_01062022192343.JPG'),('06a92526-ca74-4d2b-8146-90893d8bc0ac','ff4d532b-0863-4c3a-823a-8fb1356fa6d2','images/650x650_FETYQ8ZE_23122022232036.jpg'),('0c0a199c-1f57-4428-9f91-c1975f8d29cd','01820d3f-e566-424c-99cb-2620db9ccc5c','images/650x650_649JUM1D_29042022173550.JPG'),('0df5d28e-ea5c-4e65-b875-bd50c1abea63','01820d3f-e566-424c-99cb-2620db9ccc5c','images/650x650_M3UJ2UAM_29042022173556.JPG'),('0fe7dbaa-3688-4ce0-b050-cb79c9fa0359','9e06d88e-9bc3-478e-8d98-9fd1ab07617a','images/650x650_76ZDPO0D_09062023111713.png'),('15ef3d12-3ce5-4bdd-a07d-e12dfe761301','87efb589-3e7b-4138-ae30-e0d4c7925f60','images/400x400_3OEPAV5B_21032023140607.jpg'),('17a54db5-84af-48f5-b0fd-8b4e48bb5d59','ff4d532b-0863-4c3a-823a-8fb1356fa6d2','images/650x650_CW4ZFA71_23122022232031.jpg'),('1830285c-370d-42a0-97d3-9c3feb1f3987','c5723719-2959-411f-84b2-1dbdda3e1b35','images/650x650_G3KLNR6A_14082023131120.png'),('1b338dfe-b1f6-40c0-94fb-9ac7b1210891','74b74107-1e3d-4110-90e4-dd2a5406dbce','images/650x650_UGJTRL8H_09062023114616.jpg'),('2142a02c-db25-4ac3-aeea-d7221421ce68','13a8d87f-05ef-488b-a512-10bfefd532f1','images/650x650_YO22XMWZ_07082022164617.JPG'),('2582cef7-8183-497d-ad53-8e7e7a5573de','6e51085d-8c42-4419-b893-d928196e05e6','images/650x650_07W8U3C3_15122022142109.jpg'),('2664b2c5-13c6-4675-ae3f-582b93ec2330','f7049fb0-13bb-4e8a-9d4c-8c94577ae146','images/400x400_Q3CK2MWZ_09122022125744.jpg'),('2e505c40-a805-48a2-baa9-6c6efab334f3','6e274cc3-9529-4d9e-a5f3-62d573a0fa4a','images/650x650_PJ6V8T6R_14082023143359.png'),('34b758c9-18f6-4f57-9405-744d440e4d8b','52ccde3f-d831-4594-8f1c-1c6bd8a3b75a','images/650x650_X1BNTFOJ_29042022173902.jpg'),('36c494a2-fa21-4705-8e49-6898e4ea7b5e','01820d3f-e566-424c-99cb-2620db9ccc5c','images/650x650_8ABBODL0_29042022173554.JPG'),('4013a554-9d68-4dd4-8ab0-f8d3b1e40fe1','b10b42f3-1635-4f11-a479-f4ccf152797c','images/650x650_I4D6DV58_09072022000431.jpg'),('451959b0-255d-4d0a-a651-fa42410ae740','01820d3f-e566-424c-99cb-2620db9ccc5c','images/400x400_CI1GJIU9_29042022173544.JPG'),('4cfc1ddf-a1dc-4165-9095-c9f9615c77b7','0c6e90f6-4ba7-4efb-ac88-915b4bf1b7eb','images/650x650_M6OYPNKL_14082023144442.png'),('4fee4f14-99ce-449b-9032-f41c2620b66f','55d9e7a2-a445-448e-b011-5879d4444afe','images/650x650_ST7XTBVZ_27052022173440.JPG'),('538a5e75-8d69-4069-a7b8-4a8f86957a85','55d9e7a2-a445-448e-b011-5879d4444afe','images/650x650_UOITG8HB_27052022173446.JPG'),('58c54bd7-29cf-4521-8b14-75d7d871a425','d83a7a9e-85d6-4c76-b1d5-c2bd7d9fc12b','images/650x650_CVJW7CYP_01062022192340.JPG'),('5a332567-a202-425a-9cc4-e5a1e252299d','6e274cc3-9529-4d9e-a5f3-62d573a0fa4a','images/650x650_YKCEZO0B_14082023143401.png'),('6267b571-0612-42a8-b7aa-de3deb1bfc54','b10b42f3-1635-4f11-a479-f4ccf152797c','images/400x400_OMF10SYJ_09072022000423.jpg'),('63ddb6ee-1b3a-4871-9493-a2a9428a2f00','87efb589-3e7b-4138-ae30-e0d4c7925f60','images/650x650_0E2M8M2R_21032023140648.jpg'),('698a22ba-12ae-4af1-bbd1-fd451a08eee8','aebe7d1d-28cf-4470-9e14-8d02719cc39f','images/650x650_RZUKDZ8C_06082022203514.jpg'),('72653654-7191-4b8a-aa28-9d574511133a','d83a7a9e-85d6-4c76-b1d5-c2bd7d9fc12b','images/650x650_YBLKIYCS_02052022171133.jpg'),('727268a1-0d0a-43a6-80d5-76387db75390','77e11836-2e7a-4417-bf18-ba2e8c9dbb19','images/400x400_HZJANIJT_29042022173934.jpg'),('72794b0b-0938-47e4-a2e9-6a47501c5dde','aaaa71c3-39d9-4149-ad5c-a89160a2de3e','images/650x650_NR524GPP_01052022210144.jpg'),('79766ddd-0561-48ac-87e9-0ea29d3782e6','aebe7d1d-28cf-4470-9e14-8d02719cc39f','images/650x650_XGA4BJ5A_06082022203523.jpg'),('7adbfb63-f32b-463b-bf53-f6825d20860d','9e06d88e-9bc3-478e-8d98-9fd1ab07617a','images/400x400_NIDF8WK3_09062023111656.png'),('7efec38c-5ddb-4a37-87d8-6c3a0aaecf54','756b9f27-6ea1-46a6-b926-b6eacbf00e40','images/650x650_RWRG92PD_03052022200519.jpg'),('86765c47-97d7-4c67-88e9-6aaaa2efbf6c','13a8d87f-05ef-488b-a512-10bfefd532f1','images/400x400_KHSYHFOU_07082022164604.jpg'),('8708c75c-96a7-4632-8a76-1fa13a37fe2b','13a8d87f-05ef-488b-a512-10bfefd532f1','images/650x650_7022UCRT_07082022164610.jpg'),('88320195-ec25-43d8-b7ee-c71df0277aa7','6e51085d-8c42-4419-b893-d928196e05e6','images/400x400_WCK8WDD0_15122022142106.jpg'),('897b0251-585e-4b7c-bff8-a2bf68bd707c','ff4d532b-0863-4c3a-823a-8fb1356fa6d2','images/650x650_BAL43XWR_23122022232046.jpg'),('92168fcf-fd75-43a2-99f8-e35ae8d28ed2','d83a7a9e-85d6-4c76-b1d5-c2bd7d9fc12b','images/400x400_9ME6T79I_01062022192334.JPG'),('923e7dfa-126b-416d-a84f-2edc14b65ec5','74b74107-1e3d-4110-90e4-dd2a5406dbce','images/650x650_DNW2CXDE_09062023114620.jpg'),('959be9ad-275a-4d0d-8085-504bc2630611','77e11836-2e7a-4417-bf18-ba2e8c9dbb19','images/650x650_BQ34LU04_29042022173938.jpg'),('9c2d1819-e720-42dd-8389-9276885fe1ff','394d060c-83d4-481b-be12-3a0455c91944','images/650x650_G4RU2PIW_29042022165322.jpg'),('9c45665c-e2f7-4814-8f85-902850861cc6','756b9f27-6ea1-46a6-b926-b6eacbf00e40','images/650x650_TK0BCCKO_03052022200508.jpg'),('9c45f2cf-1d64-4375-b491-96ef3bd02677','394d060c-83d4-481b-be12-3a0455c91944','images/650x650_BX3HLOVP_29042022165324.jpg'),('9deafe5f-2fd4-4810-bafd-e4a344cada26','6e274cc3-9529-4d9e-a5f3-62d573a0fa4a','images/650x650_4WEJAH7U_14082023143354.png'),('9e764efc-d6a7-45c5-90e9-8e216a998f35','3e682476-dc37-4104-bed9-51b5f33e88c9','images/400x400_HCORZVJI_03122022135624.jpg'),('a20299ed-fdff-48d6-a3cf-6afd2d8e0fc0','0c6e90f6-4ba7-4efb-ac88-915b4bf1b7eb','images/650x650_1S6DD2M7_14082023144421.png'),('a233376f-f047-4aab-b51d-84d4ee4a2537','aebe7d1d-28cf-4470-9e14-8d02719cc39f','images/650x650_VNG5K0E3_06082022203532.jpg'),('ab30315e-fa71-4fd8-80b2-072800ee428f','0c6e90f6-4ba7-4efb-ac88-915b4bf1b7eb','images/400x400_7WP6RDR8_14082023144416.png'),('ab78cff5-5133-44f7-8ae0-a32044143325','ff4d532b-0863-4c3a-823a-8fb1356fa6d2','images/400x400_ZNLGGT2I_23122022232027.jpg'),('abb35d02-3094-4823-badf-17e55444a8dd','74b74107-1e3d-4110-90e4-dd2a5406dbce','images/400x400_3358U2GF_09062023113219.png'),('b773b9ed-99ab-43ce-b431-a9d4d8f8afa4','9e06d88e-9bc3-478e-8d98-9fd1ab07617a','images/650x650_IPW3V9S7_09062023111703.png'),('b89fd615-456a-4ea1-a8dc-14d863bfd7cc','c5723719-2959-411f-84b2-1dbdda3e1b35','images/650x650_7B8L9E1D_14082023131116.png'),('bab3314a-4bbc-4bab-8cb9-425a71a611da','aaaa71c3-39d9-4149-ad5c-a89160a2de3e','images/650x650_L8MEH7MK_01052022210142.jpg'),('bad16605-06a8-44d6-b6e6-9d8ae3119a42','394d060c-83d4-481b-be12-3a0455c91944','images/400x400_QBYMCVD5_29042022165316.jpg'),('be1880e7-acae-49da-98a9-dea4d79766dc','13a8d87f-05ef-488b-a512-10bfefd532f1','images/650x650_UHAU1AGC_07082022164634.JPG'),('bedb7609-5c4f-4b96-811a-d83a2e46739b','394d060c-83d4-481b-be12-3a0455c91944','images/650x650_SD6VR80S_29042022165318.jpg'),('c16e3049-a86a-4e7c-93c9-de2542b159b4','77e11836-2e7a-4417-bf18-ba2e8c9dbb19','images/650x650_SYAGYUGO_29042022173953.jpg'),('c2d07606-d83a-4a71-9ea1-b594527231fb','3e682476-dc37-4104-bed9-51b5f33e88c9','images/650x650_X5WXBLZM_03122022135711.jpg'),('c4ba62ea-d03b-4ddf-8d44-6bc607ce9bcd','756b9f27-6ea1-46a6-b926-b6eacbf00e40','images/400x400_IHXIQ8ZC_03052022200504.jpg'),('c627d997-d239-4230-9526-eb1298211230','3e682476-dc37-4104-bed9-51b5f33e88c9','images/650x650_E9P3ZSND_03122022135702.jpg'),('cb0bd569-d86a-4d14-abfb-bd083fb64898','0c6e90f6-4ba7-4efb-ac88-915b4bf1b7eb','images/650x650_JQW0949G_14082023144446.png'),('cf67b288-6dcc-4642-b19f-7ff3fd2b1440','c5723719-2959-411f-84b2-1dbdda3e1b35','images/400x400_9PATVB00_14082023131105.png'),('d39fed88-8ee3-4aa8-8849-30f4f74b70f3','756b9f27-6ea1-46a6-b926-b6eacbf00e40','images/650x650_JT72OPPT_03052022200512.jpg'),('d6e22638-d094-4442-9037-0ec39e574ff1','77e11836-2e7a-4417-bf18-ba2e8c9dbb19','images/650x650_0CNOLDAE_29042022174011.jpg'),('d9e6da39-d7a0-470f-a5d9-23343e0e34ab','aaaa71c3-39d9-4149-ad5c-a89160a2de3e','images/400x400_OIXXMVZX_01052022210137.jpg'),('ddafe817-eabc-4d6f-b576-d93824378ec6','52ccde3f-d831-4594-8f1c-1c6bd8a3b75a','images/400x400_M2TCHLQZ_27042022195517.jpg'),('e0303e9f-6484-4d61-80d1-5b3641529ded','c5723719-2959-411f-84b2-1dbdda3e1b35','images/650x650_SYKT8DQR_14082023131118.png'),('e2ca1d96-af17-4f3e-a114-fef71873ca02','aaaa71c3-39d9-4149-ad5c-a89160a2de3e','images/650x650_882U97ZQ_01052022210145.jpg'),('e7a2acf5-ea13-477a-860f-95fdb3a4bb6c','f7049fb0-13bb-4e8a-9d4c-8c94577ae146','images/650x650_CSN21W64_09122022125755.jpg'),('e7d3ff29-6edd-4c28-bbb0-7a8360bb4972','6e274cc3-9529-4d9e-a5f3-62d573a0fa4a','images/400x400_HWEK02BJ_14082023143350.png'),('ec74735d-eba0-45eb-b412-839a7be32aed','55d9e7a2-a445-448e-b011-5879d4444afe','images/400x400_9WGXVM70_27052022173434.JPG'),('f50bb2af-4d7e-46ed-846f-8559bc4b72ca','aebe7d1d-28cf-4470-9e14-8d02719cc39f','images/400x400_B6E54GZN_21032023140221.jpg'),('fe6d9228-de70-4e77-9829-ad079741e03a','9e06d88e-9bc3-478e-8d98-9fd1ab07617a','images/650x650_IPW3V9S7_09062023111703 (1).png');


INSERT INTO `Necklace` VALUES ('2c2e8491-fdb2-4479-b950-86501251c52c','9e06d88e-9bc3-478e-8d98-9fd1ab07617a','silver 925s',3),('3a343f6b-39f1-4510-8436-7d23a77bbbab','3e682476-dc37-4104-bed9-51b5f33e88c9','silver',5),('54206d54-6bdd-4f24-b7d5-99fb64f28213','f7049fb0-13bb-4e8a-9d4c-8c94577ae146','silver 925s',3),('9166437e-ec24-4419-bab9-9ea21dd6f2c6','aaaa71c3-39d9-4149-ad5c-a89160a2de3e','silver 925s x Ruby',4),('d503ed39-08cc-41c1-9893-d2c1b3131b61','01820d3f-e566-424c-99cb-2620db9ccc5c','silver 925s',3),('dab140c2-517b-478c-9dc1-a8e5114f7178','394d060c-83d4-481b-be12-3a0455c91944','silver 925s',2),('e5fcfa21-05fd-4ae5-b5be-9d8f67e8d897','87efb589-3e7b-4138-ae30-e0d4c7925f60','silver 925s',3);

INSERT INTO `Glasses` VALUES ('3a411c1f-791a-4cdf-8398-dab7bc3b9037','77e11836-2e7a-4417-bf18-ba2e8c9dbb19','silver 925s, Acetate',8);

INSERT INTO `Bracelet` VALUES ('4543459f-19e1-4478-89bf-7dd8929a4807','d83a7a9e-85d6-4c76-b1d5-c2bd7d9fc12b','silver 925s',4),('50ecdc90-f3eb-4a59-ade0-f8b05745a63d','13a8d87f-05ef-488b-a512-10bfefd532f1','silver 925s',2),('d675e290-1d19-40a3-9591-fdeec3a216fa','6e51085d-8c42-4419-b893-d928196e05e6','silver 925s, Emerald',4),('dd4d4883-1205-4edf-a4f0-8d39b77ab0a0','55d9e7a2-a445-448e-b011-5879d4444afe','silver 925s, Emerald',5);


INSERT INTO Earrings
VALUES
	('935f4137-97dd-4f4b-879e-d98d7102af6a','74b74107-1e3d-4110-90e4-dd2a5406dbce','9','silver 925s',5),
    ('b043adb6-92f7-4e8b-9091-05b30bc33735','74b74107-1e3d-4110-90e4-dd2a5406dbce','10','silver 925s',5),
    ('d09a989a-5c48-470d-aa04-5c65bb12a1d0','52ccde3f-d831-4594-8f1c-1c6bd8a3b75a','10','silver 925s',4);

