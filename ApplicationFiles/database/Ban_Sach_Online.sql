-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bansachonline
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `ma_Admin` int NOT NULL AUTO_INCREMENT,
  `taikhoan_Admin` varchar(20) DEFAULT NULL,
  `matkhau_Admin` varchar(50) DEFAULT NULL,
  `hoten_Admin` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gmail_Admin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ma_Admin`),
  UNIQUE KEY `taikhoan_Admin` (`taikhoan_Admin`),
  UNIQUE KEY `gmail_Admin` (`gmail_Admin`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'nhuantp','18110331','Phạm Xuân Nhuận','nhuan.cntt.k18@gmail.com'),(2,'hieuxt','18110282','Hồ Văn Hiếu','18110282@student.hcmute.edu.vn'),(3,'haibmt','18110278','Nguyễn Ngọc Hải','ngochai247@gmail.com'),(4,'tuthanhqn','18110387','Nguyễn Thanh Tú','18110387@student.hcmute.edu.vn');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietdonhang`
--

DROP TABLE IF EXISTS `chitietdonhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietdonhang` (
  `ma_DH` int NOT NULL,
  `ma_CuonSach` int NOT NULL,
  `soluong` int DEFAULT NULL,
  `gia` int DEFAULT NULL,
  PRIMARY KEY (`ma_DH`,`ma_CuonSach`),
  KEY `CTDH_maCS_FK` (`ma_CuonSach`),
  CONSTRAINT `CTDH_maCS_FK` FOREIGN KEY (`ma_CuonSach`) REFERENCES `cuonsach` (`ma_CuonSach`) ON DELETE CASCADE,
  CONSTRAINT `CTDH_maDH_FK` FOREIGN KEY (`ma_DH`) REFERENCES `donhang` (`ma_DH`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietdonhang`
--

LOCK TABLES `chitietdonhang` WRITE;
/*!40000 ALTER TABLE `chitietdonhang` DISABLE KEYS */;
INSERT INTO `chitietdonhang` VALUES (1,7,2,95000),(2,2,1,135000),(3,4,1,1400000),(3,5,3,65000),(5,1,1,49500),(5,2,1,27000),(5,5,10,150000),(6,1,1,49500),(6,2,1,27000),(6,3,1,200000),(6,4,1,36000),(6,5,4,150000),(6,26,1,9000),(6,36,4,111600),(6,39,1,33000),(7,1,1,49500),(7,5,1,150000),(8,5,1,150000),(9,5,1,150000),(10,1,1,49500),(10,2,1,27000),(10,3,1,200000),(10,5,1,150000),(11,2,1,27000),(11,5,1,150000),(12,1,2,49500),(12,5,1,150000),(13,35,20,37800),(14,1,5,49500),(14,2,3,27000),(14,6,1,36000),(14,7,1,53200),(15,5,2,150000),(16,3,1,200000),(16,7,1,50540),(17,1,1,40500),(17,7,1,48013),(18,5,1,150000),(18,7,1,52250),(19,5,1,150000),(19,7,1,52250),(20,49,1,18000),(20,50,1,28500),(20,51,1,16000),(20,52,1,18000),(20,53,1,18000),(21,1,1,40500);
/*!40000 ALTER TABLE `chitietdonhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuonsach`
--

DROP TABLE IF EXISTS `cuonsach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuonsach` (
  `ma_CuonSach` int NOT NULL AUTO_INCREMENT,
  `ma_DauSach` int DEFAULT NULL,
  `ten_CuonSach` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tacgia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  `anh_CuonSach` varchar(150) DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `giabia` int DEFAULT NULL,
  `mota` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ma_CuonSach`),
  KEY `CS_maDS_FK` (`ma_DauSach`),
  CONSTRAINT `CS_maDS_FK` FOREIGN KEY (`ma_DauSach`) REFERENCES `dausach` (`ma_DauSach`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuonsach`
--

LOCK TABLES `cuonsach` WRITE;
/*!40000 ALTER TABLE `cuonsach` DISABLE KEYS */;
INSERT INTO `cuonsach` VALUES (1,3,'Ở đây có bí kíp cưa crush','Văn Nghĩa',20,'Ởđâycóbíkípcưacrush.jpg',10,45000,'\"Crush chưa hẳn chỉ người bạn yêu, nhưng crush cũng không chỉ người mà bạn mới vừa rung rinh một tẹo. Crush nằm trên lằn ranh của yêu tha thiết đắm đuối nhiều năm và cảm nắng vài ngày là hết.\r\nBạn có muốn biến crush trở thành báu vật thực sự của riêng mình hay không?\r\nHãy đọc quyển sách này và nắm trọn bí kíp, bạn nha.\"'),(2,3,'Người mẹ cầm súng','Nguyễn Thi',20,'Ngườimẹcầmsúng.jpg',10,27000,'“Văn Nguyễn Thi không phải là thứ văn đa nghĩa, vậy mà vẫn khiến người sành văn đọc hoài. Có phải những câu chuyện hết sức bình dị ấy hàm chứa sức sống của một đất nước trong thời bão lửa chiến tranh, nhà văn là nhân chứng trung thực? Hay là do ngôn ngữ, lời ăn tiếng nói hàng ngày của người Nam Bộ, được nhà văn chọn lọc, nâng cấp trở nên giàu sức biểu cảm đến vậy?”'),(3,3,'Dế mèn phiêu lưu ký','Tô Hoài',20,'Dếmènphiêulưuký.jpg',0,200000,'Nét chữ nết người, yêu mến nhà văn Tô Hoài và tác phẩm “Dế Mèn phiêu lưu ký” không thể bỏ qua cuốn sách độc đáo này!'),(4,3,'Trong sương thương má','Trương Chí Hùng',20,'Trongsươngthươngmá.jpg',25,40000,'Mỗi trang văn trong quyển sách này có thể xem như lát cắt từ kí ức của một đứa trẻ miền Tây. Đọc Trong sương thương má, biết đâu bạn sẽ bắt gặp khung trời tuổi thơ mình trong đó. Mà tuổi thơ nào cũng chỉ đong đầy khi có má có ba…'),(5,3,'Nhâm nhi Tết Tân Sửu 2021','Nhiều tác giả',20,'NhâmnhiTếtTânSửu2021.jpg',0,150000,'Hãy cùng Sáo và Nghé thăm xuân vùng cao, ghé vào bếp nhà nào ấm lửa, rong chơi trên cao nguyên bảng lảng mây trời, ngắm cây nêu ở làng quê Bắc, chậu mai e ấp nụ xinh phương Nam, nếm canh miến măng, gà luộc, thịt đông, nem rán, bún thang, lại thêm thịt kho hột vịt, canh khổ qua, dưa món củ kiệu tôm khô.'),(6,3,'Các bạn của đam đam','Vũ Hùng',20,'Cácbạncủađamđam.jpg',10,36000,'Các bạn của Đam Đam là câu chuyện tình bạn xúc động giữa cậu bé Đam Đam và chú chó Phay Phay. Cả hai lớn lên bên nhau, bắt đầu những cuộc đi săn trong rừng sâu. Rồi Đam Đam và Phay Phay có thêm chú khỉ Xa-ni làm bạn. Cả ba cùng nhau có những kỉ niệm khó quên.'),(7,3,'Qua khỏi dốc là nhà','PhanThúy Hằng',20,'Quakhỏidốclànhà.jpg',5,55000,'Cuốn sách kết thúc ở chỗ kết thúc khoảng đời đẹp nhất với một con người – thời đi học – khiến ta nghẹn giọng, vì nỗi buồn nặng như đất, mạnh mẽ và khô rốc ở trong đó.'),(8,3,'Cuộc trùng phùng trong mơ','Nguyễn Đông Thức',20,'Cuộctrùngphùngtrongmơ.jpg',0,23000,'Với cách viết lôi cuốn, sống động mà cũng thật truyền cảm, nhà văn Nguyễn Đông Thức đưa độc giả vào một hành trình trưởng thành đầy những bất ngờ. Để ở chặng cuối, ta cảm nhận một điều giản dị: Dù gian nan trắc trở thế nào, hạnh phúc sẽ đến với ta, một khi ta có tình bạn thật ấm áp.'),(9,3,'Sự tích hoa phượng','Phạm Sông Đông',20,'Sựtíchhoaphượng.jpg',10,18000,'Hoa phượng năm cánh với sắc màu rực rỡ luôn gắn bó với tuổi thơ, học trò và mùa hạ. Thế nhưng không phải ai cũng biết, có ít nhất một truyện cổ tích vừa mang hơi hướng dân gian lại vừa có phong cách hiện đại về loài hoa thân thương này. Đó là câu chuyện cảm động về nghĩa thầy trò, lòng nhân ái, ý chí chuyên cần và sự lương thiện như ánh sáng xua đi bóng tối xấu xa, hắc ám…'),(10,3,'Thơ Xuân Hương','Hồ Xuân Hương',20,'ThơXuânHương.jpg',25,28000,'“Thơ Hồ Xuân Hương là tiếng nói tâm tình của người phụ nữ, thể hiện một bản lĩnh sống mạnh mẽ khác thường”. (Giáo sư LÊ TRÍ VIỄN)\n“Ngôn ngữ dân tộc dưới ngòi bút của Hồ Xuân Hương vừa súc tích, chính xác lại vừa uyển chuyển, linh hoạt phong phú về nghĩa, đặc sắc về tạo hình, dồi dào về âm thanh, nhịp điệu.” (Giáo sư NGUYỄN LỘC)'),(11,3,'Truyện Tây Bắc','Tô Hoài',20,'TruyệnTâyBắc.jpg',10,50000,'“Đọc Truyện Tây Bắc, chúng ta có cảm tưởng đó vừa là một bản cáo trạng, vừa là một khúc tình ca: cáo trạng đối với phong kiến miền núi và thực dân, tình ca ngợi khen cảnh đẹp, tập quán hay, tinh thần cách mạng, quan hệ giữa người và người Tây Bắc, như bản tình ca viết với một bút pháp trữ tình nồng đượm và nên thơ.”'),(12,3,'Những hạnh phúc rực rỡ','Nhiều tác giả',20,'Nhữnghạnhphúcrựcrỡ.jpg',5,38000,'Những hạnh phúc rực rỡ - cuốn sách đến từ những tác giả được yêu thích nhất của Văn Học Trẻ: Raxu Nguyễn, Jathy, Bảo Châu, Huy Hải, sẽ là món quà ý nghĩa dành cho tất cả chúng ta, đặc biệt là những người trẻ đang kiếm tìm cho mình hạnh phúc'),(13,3,'Nhạc đồng quê','Nguyễn Văn Thanh',20,'Nhạcđồngquê.jpg',0,16000,'Truyện đồng thoại vừa cổ tích vừa hiện đại, thoáng chút ưu phiền, trầm lắng trăn trở nhưng vẫn lấp lánh niềm vui, lạc quan và hi vọng như dư âm của giai điệu Nhạc đồng quê.'),(14,4,'Đóa hoa hạnh phúc','Koyoharu Gotouge',20,'Đóahoahạnhphúc.jpg',10,50000,'cuốn sách nhỏ này còn chứa những câu chuyện về Zenitsu, Inosuke và các thành viên trong đội Diệt Quỷ chưa từng được nhắc tới trong truyện chính! Không những thế, phần phụ lục “Học viện Diệt Quỷ” rất được yêu thích cũng được viết thành tiểu thuyết!! Sách tặng kèm 01 lót ly cho những bản in đầu. Xin trân trọng giới thiệu cùng bạn đọc.'),(15,4,'Mùa đông bất tận','Laura Ingalls Wilder',20,'Mùađôngbấttận.jpg',20,80000,'Những trận bão tuyết kinh hoàng giày xéo thị trấn De Smet. Tất cả mọi người trong đó có nhà Laura, mòn mỏi, buồn lo với những bữa ăn ngày càng ít ỏi và phải chống chọi với nguy cơ chết đói. Almanzo Wilder đã quyết tâm vượt bão tuyết, chấp nhận mọi rủi ro và cùng với Cap Garland đi mua lúa mì cứu thị trấn. Cuối cùng mùa xuân cũng về, mặt trời lên, cỏ xanh mướt và mọi người có thể ca hát trong no ấm, quên đi những nỗi sợ hãi suốt mùa đông khắc nghiệt...'),(16,4,'Thần thoại Hy Lạp','Phạm Văn Khỏa',20,'ThầnthoạiHyLạp.jpg',10,86000,'Chuyện những người Argonaut giành lại bộ lông cừu vàng từ miền đất Colchis thần thoại, cuộc trường chinh ròng rã một thập niên các anh hùng Hy Lạp công phá thành Troy, hải trình đầy bão táp dũng tướng Odysseus tài trí về quê xứ… là những bản trường ca của binh lửa và giáo gươm, trong một vũ trụ thần thoại có trung tâm là vẻ đẹp của con người.'),(17,4,'Câu chuyện đời tôi','Helen Keller',20,'Câuchuyệnđờitôi.jpg',10,45000,'Đây cũng là câu chuyện nổi tiếng về cô gái vừa khiếm thính, vừa khiếm thị đầu tiên trên thế giới giành được bằng đại học. Và hơn tất cả, đây là câu chuyện của trái tim − điều khiến cho tác giả Helen Keller trở  thành  “Một  trong  những  người  phụ  nữ vĩ đại nhất trong thời đại của chúng ta.”'),(18,4,'Sự tích các loài vật','Rudyard Kipling',20,'Sựtíchcácloàivật.jpg',0,160000,'Những điều thần diệu người ta thường tìm thấy trong các tác phẩm kì diệu. “Sự tích các loài vật - Chuyện như thế đó” là một tác phẩm như thế. Trong cuốn sách này, nội dung các chuyện kể chúng tôi dịch theo bản tiếng Pháp của dịch giả Nathalie Peronny và sử dụng minh họa của họa sĩ Pháp Sébastien Pelon. Chúng tôi hi vọng những nét minh họa vừa mềm mại, vừa tinh nghịch, mới mẻ, sẽ làm tăng sức hấp dẫn của 12 chuyện kể'),(19,4,'Phòng khám cho ma','Nhiều tác giả',20,'Phòngkhámchoma.jpg',0,45000,'Bởi những nguyên do hết sức tình cờ, tớ có dịp đặt chân vào thế giới yêu ma và trở thành phụ tá bất đắc dĩ cho bác sĩ Hozuki Kyujuro, người duy nhất trên đời chữa bệnh cho yêu ma quỷ quái. Những  cuộc phiêu lưu cùng bác sĩ cuốn tớ vào biết bao rắc rối. Một hôm, đúng đợt khám sức khỏe định kì ở trường tớ, bác sĩ Hozuki bất ngờ xuất hiện. Bác sĩ làm gì ở thế giới loài người nhỉ?'),(20,4,'Lớn lên trên đảo vắng','Johann David Wyss',20,'Lớnlêntrênđảovắng.jpg',15,58000,'Những chi tiết thú vị về cuộc sống nơi hoang dã, những bài học bổ ích về thế giới tự nhiên đã khiến \"Lớn lên trên đảo vắng\" của Johann David Wyss trở thành một trong những tác phẩm nổi tiếng nhất mọi thời đại'),(21,4,'Đảo giấu vàng','R.L.Stevenson',20,'Đảogiấuvàng.jpg',0,36000,'Ngay sau khi xuất bản, câu chuyện đi tìm kho báu của nhà văn Stevenson đã tạo nên một tiếng vang lớn. Thủ tướng Anh khi đó là William Gladstone đã thức tới hai giờ sáng để đọc hết cuốn sách. Đến nay, đã có hơn 50 bộ phim truyện và phim truyền hình được chuyển thể từ tác phẩm của Stevenson. Và trải qua một thời gian dài, Đảo giấu vàng đã trở nên gắn bó với nhiều thế hệ độc giả nhỏ tuổi trên toàn thế giới'),(22,4,'Công chúa nhỏ','Hodgson Burnett',20,'Côngchúanhỏ.jpg',10,68000,'Với tâm hồn trong trẻo và cao quý của một nàng công chúa, Sara có thể can đảm vượt qua tất cả những nghiệt ngã để vươn tới cuộc sống tốt đẹp trong tương lai? Đó là một câu chuyện cảm động sâu sắc về nhân cách của nàng công chúa bé nhỏ và, chắc chắn rồi, về cả những phép màu...'),(23,4,'Hoàng tử bé','Saint Exupéry',20,'Hoàngtửbé.jpg',0,25000,'“Hoàng Tử Bé” (tên tiếng Pháp: Le Petit Prince) xuất bản năm 1943 và là tác phẩm nối tiếng nhất trong sự nghiệp của nhà văn phi công Pháp Antoine de Saint-Exupéry. Tác phẩm đã được dịch sang hơn 250 ngôn ngữ và cho đến nay đã bán được hơn 200 triệu bản khắp thế giới.'),(24,4,'Lối thoát tử thần','Dames Dashner',20,'Lốithoáttửthần.jpg',10,95000,'Trong một thế giới bị tàn phá vì biến đổi khí hậu, Thomas và các bạn làm mọi cách để sống sót và tồn tại. Nhưng, hiểm họa lớn nhất lại đến từ phía khó ngờ nhất: Con người. Con người mù quáng vì tham vọng. Con người điên cuồng vì hận thù. Con người vì virus Nhật trùng mà mất hết nhân tính. Ai sẽ sống sót? Ai sẽ chấp nhận hi sinh vì sự tồn vong của nhân loại? Lối thoát nào đang chờ đợi những người trẻ sau quá nhiều mất mát đau thương?'),(25,4,'Hành trình hy vọng','Nhiều tác giả',20,'Lốithoáttửthần.jpg',8,30000,'Chú ngựa mang tên Vẻ đẹp đen bị bán đi từ khi còn nhỏ xíu. Cậu không biết rằng mình sẽ phải trải qua rất nhiều khó khăn và hiểm nguy trong suốt quãng đời tiếp theo của mình. Hãy cùng đọc câu chuyện do chính Vẻ đẹp đen kể lại nhé!'),(26,1,'Chị Sáu ở Côn Đảo',' Lê Quang Vịnh',20,'ChịSáuởCônĐảo.jpg',10,10000,'Truyện kể về chị Võ Thị Sáu, người con gái Đất Đỏ anh hùng.'),(27,1,'Lý Thường Kiệt','Tạ Huy Long',20,'LýThườngKiệt.jpg',7,15000,'Lý Thường Kiệt tên thật là Ngô Tuấn, một vị tướng kiệt xuất trong lịch sử Việt Nam. Ông nhiều lần thống lĩnh ba quân “phá Tống, bình Chiêm”, giữ bờ cõi nhiều năm trong cảnh thanh bình. Ông lại đem tài sức giúp vua Lý phát mở mang canh nông, xây dựng nhà học, góp phần gây dựng nền văn hiến Đại Việt'),(28,1,'Suốt đời học Bác','Kiều Mai Sơn',20,'SuốtđờihọcBác.jpg',10,40000,'Bác Hồ, vị lãnh tụ kính yêu của dân tộc Việt Nam, người chiến sĩ cộng sản suốt đời tận tụy vì nước, vì dânvới những phẩm chất giản dị mà cao đẹp luôn là tấm gương sáng cho nhiều thế hệ tìm hiểu, học tập, noi theo.'),(29,1,'Người lính Điện Biên kể chuyện','Kiều Mai Sơn',20,'NgườilínhĐiệnBiênkểchuyện.jpg',10,30000,'“Mỗi lần trở lại Điện Biên Phủ, tôi tới nghĩa trang liệt sĩ dưới chân đồi A1 thắp nén hương tưởng niệm những người đồng đội đã nằm lại đây. Đứng trước rất nhiều ngôi mộ không có tên, tôi hình dung ra anh chiến sĩ trẻ tới chiến trường giữa trận đánh, chiến đấu bên những người đồng đội chưa kịp biết tên mình và mình cũng chưa kịp biết là ở đơn vị nào...”'),(30,1,'Chu Văn An','Nhiều tác giả',20,'ChuVănAn.jpg',0,50000,'hân kỉ niệm 650 năm ngày mất Chu Văn An (1370 - 2020), Nhà xuất bản Kim Đồng trân trọng gửi tới các em cuốn sách này - nơi những trang sách ghi lại nét đẹp nhân cách người thầy mẫu mực - nhà giáo Chu Văn An'),(31,1,'Nghìn xưa Văn Hiến','Trần Quốc Vượng',20,'NghìnxưaVănHiến.jpg',0,198000,'Cuốn sách “Nghìn xưa văn hiến” được xây dựng từnhững năm 60 - 70 của thế kỉ trước với vai trò chủ đạo củanhà sử học Trần Quốc Vượng, cùng sự đóng góp công phucủa các nhà nghiên cứu lịch sử và văn hóa truyền thông cóuy tín là Nguyễn Từ Chi, Nguyễn Cao Lũy, Nguyễn Trần Đản.'),(32,1,'Kim Đồng','Tô Hoài',20,'KimĐồng.jpg',0,24000,'Cuốn sách là câu chuyện cảm động về một trong những đội viên đầu tiên của Đội Thiếu niên Tiền phong Hồ Chí Minh - anh Kim Đồng.'),(33,1,'Lý Tự Trọng','Nhiều tác giả',20,'LýTựTrọng.jpg',10,30000,'Câu chuyện về cuộc đời và tấm gương hi sinh anh dũng của anh Lý Tự Trọng đã được kể bằng nhiều hình thức nghệ thuật như văn học, điện ảnh, âm nhạc… Đây là lần đầu tiên hình tượng những người anh hùng thiếu niên Lý Tự Trọng được tái hiện trong tác phẩm sách tranh minh họa màu khổ lớn'),(34,1,'Trong giông gió Trường Sa','Nhiều tác giả',20,'TronggiônggióTrườngSa.jpg',10,30000,'Qua những trang viết giàu hình ảnh và đầy xúc cảm, độc giả sẽ được trải nghiệm cuộc sống trên đảo với nhiều cung bậc cảm xúc: một Trường Sa thật dữ dội, khắc nghiệt nhưng cũng thật hiền hòa, dịu êm; cuộc sống trên đảo có lúc cô đơn rợn ngợp nhưng cũng thật thú vị, đầm ấm, chứa chan tình người. Đọc xong cuốn sách, chắc hẳn mỗi độc giả sẽ đều ấp ủ mong muốn một lần được đến với Trường Sa'),(35,2,'Vén màn ảo thuật','John Wood',20,'Vénmànảothuật.jpg',8,40000,'Cuốn sách giới thiệu về Ảo thuật đánh lừa thị giác. Vậy là, bạn muốn trở thành một ảo thuật gia phải không nào? Chà, bạn tìm tới đúng chỗ rồi đấy. Rất nhiều bí mật đang chờ bạn khám phá bên trong cuốn sách này. Đọc xong sách, bạn sẽ trở thành bậc thầy về ảo thuật đánh lừa thị giác. Cùng bắt đầu nhé!'),(36,2,'Từ điển cảm xúc cho bé','Chuyện',20,'Từđiểncảmxúcchobé.jpg',10,124000,'Từ điển cảm xúc cho bé là cuộc phiêu lưu của bố mẹ và bé vào thế giới ngôn từ. Những từ ngữ mới lạ mô tả rất nhiều cảm xúc, hành động, tình cảm khác nhau mà bố mẹ có thể dạy cho các bé, gieo những hạt mầm đầu tiên vào tâm trí trẻ thơ, giúp bé yêu ngôn ngữ, chăm đọc sách, ngày càng hiểu biết cuộc sống và thế giới này.'),(37,2,'Vòng quanh thế giới','Hoài Nam',20,'Vòngquanhthếgiới.jpg',0,12000,'Mỗi đất nước trên thế giới đều có rất nhiều điều thú vị để khám phá. Với chuyến du hành Vòng quanh thế giới, bạn sẽ được ghé thăm rất nhiều quốc gia, địa điểm nổi tiếng, biết thêm nhiều truyền thống văn hóa, lễ hội lí thú của con người khắp mọi nơi. Nào, còn chần chừ gì nữa, lên đường thôi!'),(38,2,'Châu Âu huyền bí','Phillip Ngo',20,'ChâuÂuhuyềnbí.jpg',0,85000,'Hi vọng các bạn cùng tôi bước vào chuyến phiêu lưu kì bí, tha hồ sởn gai ốc và cũng học rất nhiều điều về lịch sử, văn hóa của châu Âu.'),(39,5,'Không sao đâu con','Shen Nuan',20,'Khôngsaođâucon.jpg',0,33000,'Thật vui khi được dự sinh nhật bạn thân, phải không các em? Bạn heo con trong câu chuyện này hớn hở mang một đoá hoa tươi đến làm quà sinh nhật bạn. Nhưng, trên đường đi, cậu gặp phải rất nhiều rắc rối. Chuyện gì xảy ra thế nhỉ? Chúng mình cùng đọc truyện nhé!'),(40,5,'Cần cả ngôi làng','Hillary Rodham Clinton',20,'Cầncảngôilàng.jpg',0,40000,'Nếu thế giới là một ngôi làng, hãy chung tay xây một ngôi làng đáng sống cho mọi trẻ em trên đời.'),(41,5,'Tý Quậy - Tập 1','Đào Hải',20,'TýQuậy-Tập1.jpg',0,40000,'“ Những trò đùa vui học trò ai cũng đã từng kinh qua, những nghịch ngợm nho nhỏ trên đường trưởng thành… bạn đọc nhí sẽ cười nghiêng ngả, cha mẹ cũng bật cười : “ Sao Tý và Tèo giống mình ngày xưa quá vậy!” Sau những trận cười ấy, hẳn bạn sẽ nhận ra điều nhắn nhủ giản đơn mà sâu sắc của tác giả, giúp chúng ta  học hỏi và tiến bộ hơn sau mỗi tiếng cười vui vẻ.'),(42,5,'Tý Quậy - Tập 2','Đào Hải',20,'TýQuậy-Tập2.jpg',0,40000,'“ Những trò đùa vui học trò ai cũng đã từng kinh qua, những nghịch ngợm nho nhỏ trên đường trưởng thành… bạn đọc nhí sẽ cười nghiêng ngả, cha mẹ cũng bật cười : “ Sao Tý và Tèo giống mình ngày xưa quá vậy!” Sau những trận cười ấy, hẳn bạn sẽ nhận ra điều nhắn nhủ giản đơn mà sâu sắc của tác giả, giúp chúng ta  học hỏi và tiến bộ hơn sau mỗi tiếng cười vui vẻ.'),(43,5,'Tý Quậy - Tập 3','Đào Hải',20,'TýQuậy-Tập3.jpg',0,40000,'“ Những trò đùa vui học trò ai cũng đã từng kinh qua, những nghịch ngợm nho nhỏ trên đường trưởng thành… bạn đọc nhí sẽ cười nghiêng ngả, cha mẹ cũng bật cười : “ Sao Tý và Tèo giống mình ngày xưa quá vậy!” Sau những trận cười ấy, hẳn bạn sẽ nhận ra điều nhắn nhủ giản đơn mà sâu sắc của tác giả, giúp chúng ta  học hỏi và tiến bộ hơn sau mỗi tiếng cười vui vẻ.'),(44,5,'Tý Quậy - Tập 4','Đào Hải',20,'TýQuậy-Tập4.jpg',0,40000,'Chúng ta như tìm thấy chính mình trong hình ảnh của Tý và Tèo những lúc nghịch ngợm, bị điểm kém, bị bố mẹ mắng... hay những phút giây nhận ra lỗi lầm và thấy mình ngày một trưởng thành, lớn khôn hơn, biết yêu thương cha mẹ, kính trọng thầy cô và yêu quý bè bạn.'),(45,5,'Tý Quậy - Tập 5','Đào Hải',20,'TýQuậy-Tập5.jpg',0,40000,'Chúng ta như tìm thấy chính mình trong hình ảnh của Tý và Tèo những lúc nghịch ngợm, bị điểm kém, bị bố mẹ mắng... hay những phút giây nhận ra lỗi lầm và thấy mình ngày một trưởng thành, lớn khôn hơn, biết yêu thương cha mẹ, kính trọng thầy cô và yêu quý bè bạn.'),(46,5,'Tý Quậy - Tập 6','Đào Hải',20,'TýQuậy-Tập6.jpg',0,40000,'Chúng ta như tìm thấy chính mình trong hình ảnh của Tý và Tèo những lúc nghịch ngợm, bị điểm kém, bị bố mẹ mắng... hay những phút giây nhận ra lỗi lầm và thấy mình ngày một trưởng thành, lớn khôn hơn, biết yêu thương cha mẹ, kính trọng thầy cô và yêu quý bè bạn.'),(47,5,'Tý Quậy - Tập 7','Đào Hải',20,'TýQuậy-Tập7.jpg',0,40000,'“ Những trò đùa vui học trò ai cũng đã từng kinh qua, những nghịch ngợm nho nhỏ trên đường trưởng thành… bạn đọc nhí sẽ cười nghiêng ngả, cha mẹ cũng bật cười : “ Sao Tý và Tèo giống mình ngày xưa quá vậy!” Sau những trận cười ấy, hẳn bạn sẽ nhận ra điều nhắn nhủ giản đơn mà sâu sắc của tác giả, giúp chúng ta  học hỏi và tiến bộ hơn sau mỗi tiếng cười vui vẻ.'),(48,5,'Bật đèn soi bí mật','Carron Brown',20,'Bậtđènsoibímật.jpg',10,45000,'Sách tranh kiến thức đơn giản về thiên nhiên, phương tiện giao thông và kì quan thế giới với thể nghiệm mới - soi đèn pin để tìm đáp án'),(49,6,'Gintama - Tập 65','Hideaki Sorachi',20,'Gintama-Tập65.jpg',10,20000,'Quỷ Biển buộc phải quyết chiến với Utsuro nhằm bảo vệ gia đình. Trước kẻ địch quá mạnh, ông ta chỉ còn cách lấy mạng đổi mạng. Mặt khác, Kamui vô cùng thèm khát danh hiệu “mạnh nhất vũ trụ” của cha mình, bản năng bộ tộc Yato trong cậu liền trỗi dậy.'),(50,6,'Đạo làm chồng đảm - Tập 2','Kousuke Oono',20,'Đạolàmchồngđảm-Tập2.jpg',5,30000,'Huyền thoại của giới xã hội đen - Tatsu Bất Tử - sau khi lấy vợ bỗng lột xác trở thành một người chồng siêu đảm đang! Từ NẤU CƠM, GIẶT GIŨ đến ĐI CHỢ, QUÉT NHÀ… mọi thứ đều CHU TOÀN TUYỆT ĐỐI!!'),(51,6,'Doraemon Plus - Tập 2','Fujiko F Fujio',20,'DoraemonPlus-Tập2.jpg',20,20000,'Doraemon Plus tập hợp những truyện ngắn chưa từng có trong bộ truyện Doraemon 45 tập đã rất quen thuộc với tất cả chúng ta. Đặc biệt Doraemon Plus tập 6 còn giới thiệu 21 truyện ngắn cực kì hấp dẫn và chưa từng được công bố!'),(52,6,'Gintama - Tập 63','Hideaki Sorachi',20,'Gintama-Tập63.jpg',10,20000,'Cuộc chiến với tam hung tinh của Mưa Xuân và đám cường địch đã khiến Katsura, Sakamoto, Gintoki dần kiệt sức. Katsura đọ kiếm với gã lực sĩ đội trưởng đội 4, trong khi đó Sakamoto, Gintoki cũng khổ chiến với tinh thần của những võ sĩ cuối cùng còn lại…'),(53,6,'Gintama - Tập 64','Hideaki Sorachi',20,'Gintama-Tập64.jpg',10,20000,'Khi cuộc chiến giữa các phe phái Mưa Xuân, Quỷ Biển và nhóm Gintoki lên tới đỉnh điểm gay cấn thì cuối cùng, “người đó” đã tỉnh lại… Lần nào gặp nhau, hai cha con Kamui và Quỷ Biển cũng tranh cãi gay gắt, nay có thêm sự góp mặt của Kagura, bí mật về gia đình họ đã dần được hé lộ…'),(54,6,'Gintama - Tập 66','Hideaki Sorachi',20,'Gintama-Tập66.jpg',10,20000,'Khi xưa, thầy Shoyo đã tới thôn Tùng Hạ mở lớp học cùng đệ tử đầu tiên là Oboro. Sau đó, Oboro rời khỏi đó, trở thành thủ lĩnh của Naraku. Chính hắn đã tiết lộ âm mưu kinh thiên động địa mà Utsuro suy tính bấy lâu. Utsuro đã chọn cách thức nào để kết thúc sinh mệnh vĩnh cửu của mình đây?'),(55,6,'Gintama - Tập 67','Hideaki Sorachi',20,'Gintama-Tập67.jpg',10,20000,'Để ngăn chặn chiến tranh tầm cỡ vũ trụ do Utsuro khởi xướng. Tokugawa Nobunobu âm mưu liên minh mới quân giải phóng. Cuộc liên minh ấy sẽ đem lại kết quả gì đây? Mặt khác, đội quân bất tử Utsuro phóng thích đang hoành hành khắp Edo, tình hình nguy khốn hơn bao giờ hết. Ấy thế mà, lại một lần nữa...'),(56,6,'Gintama - Tập 68','Hideaki Sorachi',20,'Gintama-Tập68.jpg',10,20000,'Người dân Edo và lính Mạc Phủ cũ đang nhất tề đứng dậy chống lại gọng kìm của không quân và lục quân giải phóng. Giữ lúc dầu sôi lửa bỏng, kĩ sư vĩ đại Gengai đã tung ra vũ khí bí mật vô cùng lợi hại. Cùng lúc đó, Tiệm Vạn Năng cũng tái xuất giang hồ!!'),(57,6,'Gintama - Tập 69','Hideaki Sorachi',20,'Gintama-Tập69.jpg',10,20000,'Nhằm hồi phục sau thương tích do đại bác khổng lồ Gengai gây ra, quân Shinra đã bắt cóc Otae và mọi người rồi đuổi theo “kẻ khai thác năng lượng”. Trước tình hình Edo đang tan rã, nhóm “hộ vệ Kabuki” hết sức đau lòng, họ buộc phải quay lại và giải cứu cho những con tin...'),(58,6,'Gintama - Tập 70','Hideaki Sorachi',20,'Gintama-Tập70.jpg',10,20000,'Quân giải phóng đã bắt cóc ông Gengai để ngăn chặn virus-những cỗ máy siêu nhỏ- đang lây lan khắp Địa Cầu. Chúng cưỡng ép ông bằng cách bổ sung Trái Đất vào danh sách những hành tinh chờ phá huỷ. Ngay thời điểm nguy khốn ấy, bất ngờ xuất hiện một đạo quân tiếp viện...'),(59,6,'Gintama - Tập 71','Hideaki Sorachi',20,'Gintama-Tập71.jpg',10,20000,'Ý đồ của Utsuro đã rõ! Hắn sẽ cholong mạch Altana va chạm với vũ khí của quân giải phóng để tạo ra một cú nổ lớn đủ sức phá tan tành cả thế giới. Để ngăn chặn họng pháo khổng lồ của quân giải phóng, Binh Đoàn Quỷ đã kêu gọi toàn quân tham chiến. Và rồi, vào giờ khắc quan trọng, một vị anh hùng đã giáng thế!?'),(60,6,'Gintama - Tập 72','Hideaki Sorachi',20,'Gintama-Tập72.jpg',10,20000,'Ensho và Takasugi. Thứ trói buộc những kẻ sẵn sàng vứt bỏ mạng sống của mình nơi chiến trường phải chăng là xiềng xích của thù hận? Trên mặt đất lúc này, còn có một nhóm người nọ cũng đang cật lực góp phần ngăn chặn họng pháo khổng lồ kia. Thậm chí là cả cún con Sadaharu...'),(61,6,'Gintama - Tập 73','Hideaki Sorachi',20,'Gintama-Tập73.jpg',10,20000,'Chiến hạm Amenotori đã mất kiểm soát và vẫn đang tiếp tục rơi tự do xuống Địa Cầu. Trước cảnhdân tình đang căng thẳng nghĩ cách ngăn con tàu này va chạm với nguồn Altana sôi sục bên dưới, chú Hasegawa đã nảy ra một ý tưởng không ai ngờ tới!? Giữa lúc dầu sôi lửa bỏng, cơ thể Utsuro đã có một thay đổi lạ lùng khi giao chiến với tiệm Vạn Năng...'),(62,6,'Gintama - Tập 74','Hideaki Sorachi',20,'Gintama-Tập74.jpg',10,20000,'Cảm xúc của Utsuro đã bắt đầu lay động khi chứng kiến những con người với sinh mệnh ngắn ngủi đang không ngần ngại xả thân vì nhau. Thêm nữa, các phản ứng của long mạch Altana đã suy yếu khiến Utsuro không thể chống đỡ sự tấn công dồn dập của bọn Gintoki. Trận chiến sinh tử đang dần đi vào hồi kết và vận mệnh của Trái Đất sẽ ra sao?'),(63,6,'Gintama - Tập 75','Hideaki Sorachi',20,'Gintama-Tập75.jpg',10,20000,'Gintoki bị một đám không rõ thân thế truy đuổi gắt gao. Chúng lăm le cướp đi một món hàng cực kì quý giá trên người anh. Sau 2 năm ở ẩn và tu luyện đạt tới trí tuệ siêu việt, Gintoki đã thu về được thành quả gì?');
/*!40000 ALTER TABLE `cuonsach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ma_Customer` int NOT NULL AUTO_INCREMENT,
  `taikhoan_Customer` varchar(20) DEFAULT NULL,
  `matkhau_Customer` varchar(20) DEFAULT NULL,
  `hoten_Customer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gmail_Customer` varchar(100) DEFAULT NULL,
  `sdt_Customer` varchar(10) DEFAULT NULL,
  `vitien` int DEFAULT NULL,
  PRIMARY KEY (`ma_Customer`),
  UNIQUE KEY `taikhoan_Customer` (`taikhoan_Customer`),
  UNIQUE KEY `gmail_Customer` (`gmail_Customer`),
  UNIQUE KEY `sdt_Customer` (`sdt_Customer`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'taitran234','123','Lương Trần Tài','luongtrantai23@gmail','0987290386',10000000),(2,'vanphuc37N','222','Nguyễn Văn Phúc','bentre71@gmail.com','113',10000000),(3,'giang247','333','Dương Ngọc Giang','giang49@gmail.com','114',10000000),(4,'nghiahuynh11','444','Huỳnh Trọng Nghĩa','nghiapmp@gmail.com','115',10000000),(5,'phapcute09','555','Nguyễn Văn Pháp','phapvanspkt@gmail.com','116',10000000),(7,'haibmt','18110278','Nguyễn Ngọc Hải','tienkg5554@gmail.com','4123123',1000000),(8,'haibmt1','18110278','Nguyễn Ngọc Hải','ngochai2000bmt@gmail.com','12',1000000);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dausach`
--

DROP TABLE IF EXISTS `dausach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dausach` (
  `ma_DauSach` int NOT NULL AUTO_INCREMENT,
  `ten_DauSach` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ma_DauSach`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dausach`
--

LOCK TABLES `dausach` WRITE;
/*!40000 ALTER TABLE `dausach` DISABLE KEYS */;
INSERT INTO `dausach` VALUES (1,'Lịch sử - Truyền thống'),(2,'Kiến thức khoa học'),(3,'Văn học Việt Nam'),(4,'Văn học nước ngoài'),(5,'Truyện tranh'),(6,'Manga - Comic');
/*!40000 ALTER TABLE `dausach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donhang`
--

DROP TABLE IF EXISTS `donhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donhang` (
  `ma_DH` int NOT NULL AUTO_INCREMENT,
  `ma_Customer` int DEFAULT NULL,
  `diachi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sdt` varchar(15) DEFAULT NULL,
  `ngaydat` timestamp NULL DEFAULT NULL,
  `tongtien` int DEFAULT NULL,
  `tinhtrang` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ma_DH`),
  KEY `DH_maCustomer_FK` (`ma_Customer`),
  CONSTRAINT `DH_maCustomer_FK` FOREIGN KEY (`ma_Customer`) REFERENCES `customer` (`ma_Customer`) ON DELETE CASCADE,
  CONSTRAINT `DH_activeDH_CHK` CHECK ((`tinhtrang` in (_utf8mb4'Đã giao',_utf8mb4'Chưa giao')))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donhang`
--

LOCK TABLES `donhang` WRITE;
/*!40000 ALTER TABLE `donhang` DISABLE KEYS */;
INSERT INTO `donhang` VALUES (1,3,'KTX Khu D1','0987935915','2020-12-04 17:00:00',190000,'Đã giao'),(2,1,'Xuân Thọ - Đà Lạt','0368103208','2020-12-03 17:00:00',135000,'Chưa giao'),(3,3,'Bến Tre','0327300035','2020-12-05 17:00:00',1595000,'Đã giao'),(5,3,'kí túc xá đại học sư phạm kĩ thuật tphcm','0983553096','2021-01-12 14:25:48',1576500,'Chưa giao'),(6,3,'kí túc xá đại học sư phạm kĩ thuật tphcm','0983553096','2021-01-12 15:48:19',1400900,'Chưa giao'),(7,3,'kí túc xá đại học sư phạm kĩ thuật tphcm','0983553096','2021-01-12 15:53:50',199500,'Chưa giao'),(8,3,'kí túc xá đại học sư phạm kĩ thuật tphcm','0983553096','2021-01-12 15:57:26',150000,'Chưa giao'),(9,3,'kí túc xá đại học sư phạm kĩ thuật tphcm','0983553096','2021-01-12 16:04:03',150000,'Chưa giao'),(10,3,'kí túc xá đại học sư phạm kĩ thuật tphcm','0983553096','2021-01-12 16:04:38',426500,'Chưa giao'),(11,3,'kí túc xá đại học sư phạm kĩ thuật tphcm','0983553096','2021-01-12 16:12:16',177000,'Chưa giao'),(12,3,'kí túc xá đại học sư phạm kĩ thuật tphcm','0983553096','2021-01-13 03:49:04',249000,'Chưa giao'),(13,3,'kí túc xá đại học sư phạm kĩ thuật tphcm','0983553096','2021-01-13 06:39:27',756000,'Chưa giao'),(14,3,'kí túc xá đại học sư phạm kĩ thuật tphcm','0983553096','2021-01-13 07:01:41',417700,'Chưa giao'),(15,3,'kí túc xá đại học sư phạm kĩ thuật tphcm','0983553096','2021-01-13 08:09:53',300000,'Chưa giao'),(16,3,'kí túc xá đại học sư phạm kĩ thuật tphcm','0983553096','2021-01-14 04:44:59',250540,'Chưa giao'),(17,3,'kí túc xá đại học sư phạm kĩ thuật tphcm','0983553096','2021-01-14 04:54:37',88513,'Chưa giao'),(18,3,'kí túc xá đại học sư phạm kĩ thuật tphcm','0983553096','2021-01-14 04:57:24',202250,'Chưa giao'),(19,3,'kí túc xá đại học sư phạm kĩ thuật tphcm','0983553096','2021-01-14 05:01:42',202250,'Đã giao'),(20,3,'kí túc xá đại học sư phạm kĩ thuật tphcm','0983553096','2021-01-14 05:11:05',98500,'Chưa giao'),(21,7,'123','123','2021-01-14 14:21:48',40500,'Đã giao');
/*!40000 ALTER TABLE `donhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giaohang`
--

DROP TABLE IF EXISTS `giaohang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giaohang` (
  `ma_DH` int NOT NULL,
  `ma_Shipper` int NOT NULL,
  PRIMARY KEY (`ma_DH`,`ma_Shipper`),
  KEY `GIAOHANG_maShipper_FK` (`ma_Shipper`),
  CONSTRAINT `GIAOHANG_maDH_FK` FOREIGN KEY (`ma_DH`) REFERENCES `donhang` (`ma_DH`) ON DELETE CASCADE,
  CONSTRAINT `GIAOHANG_maShipper_FK` FOREIGN KEY (`ma_Shipper`) REFERENCES `shipper` (`ma_Shipper`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giaohang`
--

LOCK TABLES `giaohang` WRITE;
/*!40000 ALTER TABLE `giaohang` DISABLE KEYS */;
INSERT INTO `giaohang` VALUES (1,1),(10,1),(14,1),(19,1),(21,1),(2,2),(3,2),(20,2);
/*!40000 ALTER TABLE `giaohang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giohang`
--

DROP TABLE IF EXISTS `giohang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giohang` (
  `ma_Customer` int NOT NULL,
  `ma_CuonSach` int NOT NULL,
  `soluong` int DEFAULT NULL,
  PRIMARY KEY (`ma_Customer`,`ma_CuonSach`),
  KEY `GH_maCS_FK` (`ma_CuonSach`),
  CONSTRAINT `GH_maCS_FK` FOREIGN KEY (`ma_CuonSach`) REFERENCES `cuonsach` (`ma_CuonSach`),
  CONSTRAINT `GH_maCUS_FK` FOREIGN KEY (`ma_Customer`) REFERENCES `customer` (`ma_Customer`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giohang`
--

LOCK TABLES `giohang` WRITE;
/*!40000 ALTER TABLE `giohang` DISABLE KEYS */;
INSERT INTO `giohang` VALUES (1,1,2),(1,2,1),(2,7,2);
/*!40000 ALTER TABLE `giohang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `ma_Review` int NOT NULL AUTO_INCREMENT,
  `ma_Customer` int DEFAULT NULL,
  `ngay_Review` timestamp NULL DEFAULT NULL,
  `binhluan` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ma_Review`),
  KEY `RV_maCustomer_FK` (`ma_Customer`),
  CONSTRAINT `RV_maCustomer_FK` FOREIGN KEY (`ma_Customer`) REFERENCES `customer` (`ma_Customer`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,3,'2020-12-11 17:00:00','Sách còn mới, như quảng cáo. Nói chung tốt, sẽ quay lại ủng hộ shop tiếp ạ'),(2,1,'2021-01-11 14:19:24','Shop chất lượng, sách đẹp.'),(3,2,'2021-01-11 14:19:38','Sách không bị nếp gấp, giá thành phải chăng hợp lí.');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipper`
--

DROP TABLE IF EXISTS `shipper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipper` (
  `ma_Shipper` int NOT NULL AUTO_INCREMENT,
  `taikhoan_Shipper` varchar(20) DEFAULT NULL,
  `matkhau_Shipper` varchar(20) DEFAULT NULL,
  `hoten_Shipper` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gmail_Shipper` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ma_Shipper`),
  UNIQUE KEY `taikhoan_Shipper` (`taikhoan_Shipper`),
  UNIQUE KEY `gmail_Shipper` (`gmail_Shipper`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipper`
--

LOCK TABLES `shipper` WRITE;
/*!40000 ALTER TABLE `shipper` DISABLE KEYS */;
INSERT INTO `shipper` VALUES (1,'giang247','19110193','Dương Ngọc Giang','giangxt@gmail.com'),(2,'dangkhoabt','18110227','Phạm Đăng Khoa','khoaphambt71@gmail.com');
/*!40000 ALTER TABLE `shipper` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-14 22:06:22
