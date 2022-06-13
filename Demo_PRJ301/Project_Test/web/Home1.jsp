<%-- 
    Document   : Home1
    Created on : Jun 10, 2022, 4:20:36 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<link href="CSS/Style.css" rel="stylesheet" type="text/css">
	<title>Welcome to Fashion Website</title>
	<link href="CSS/Style_slideshow.css" rel="stylesheet" type="text/css">
	<script src="JS/script_1.js"></script>
	<link href="CSS/Style_GioiThieu.css" rel="stylesheet" type="text/css">
</head>

<body>
	<header>
		<div class="banner-top">
			<img src="Images/Web/banner_top.PNG" >
		</div>
		<div id="logo">
			<img src="Images/Web/Logo.JPG" />
		</div>
		<div id="dn">
			<img src="Images/account/img_acc_1.png" /><a href="DangNhap.html" target="_blank">Đăng nhập</a><a href="DangKy.html" target="_blank"> | Đăng ký</a>
			<img src="Images/account/img_acc_2.png" /><a href="#">Giỏ hàng (Trống)</a>
		</div>
	</header>
	
	<nav>
		<div id="subnav">
			<ul>
				<li><a href="index.html" target="_blank">TRANG CHỦ</a></li>
				<li><a href="SanPham.html" target="_blank">SẢN PHẨM</a></li>
				<li><a href="GioiThieu.html" target="_blank">GIỚI THIỆU</a></li>
				<li><a href="LienHe.html" target="_blank">LIÊN HỆ</a></li>
			</ul>
			<div>
				<input type="search" placeholder="Tìm sản phẩm của bạn ..." size="36" name="Search" />
				<input type="submit" value="Tìm kiếm" title="Tìm sách" />
			</div>
		</div>
	</nav>
	
	<div class="slide-container">
		<div class="slide-stage">
			<img class="hinhslide" src="Images/Web/slider_1.jpg">
			<img class="hinhslide" src="Images/Web/slider_2.jpg" style="display: none">
			<img class="hinhslide" src="Images/Web/slider_3.jpg" style="display: none">
			<img class="hinhslide" src="Images/Web/slider_4.jpg" style="display: none">
			<img class="hinhslide" src="Images/Web/slider_5.jpg" style="display: none">
		</div>
		<img src="Images/Web/prev.png" class="prev" onClick="plusSlides(-1)">
		<img src="Images/Web/next.png" class="next" onClick="plusSlides(1)">
	</div>
	<div class="service">
		<a href="#"><img src="Images/Web/service.JPG"></a>
	</div>
	
	<div id="body">
		<article>
			<section>
				<div class="introduce-container">
					<p>GIỚI THIỆU</p>
					<p>TẦM NHÌN - SỨ MỆNH YODY: NÂNG TẦM THƯƠNG HIỆU VIỆT</p>
					<img src="Images/Introduce/introduce_1.jpg">
					<p>
						Bắt đầu từ thương hiệu thời trang Hi5 ra đời trong năm 2009, trải qua chặng đường phát triển đầy khó khăn, Hi5 được đổi tên thành Yody vào năm 2014 với ước mơ gây dựng một thương hiệu thời trang hàng đầu thế giới.<br>

						<br>Từ đó trở đi Yody lớn mạnh không ngừng, đến năm 2016 Yody đã có 38 cửa hàng, chỉ sau 2 năm vào năm 2018 Yody đã có 73 cửa hàng. Đến năm 2019 Yody đã có 82 cửa hàng và tính đến thời điểm hiện tại Yody đã mở rộng được hơn 100 cửa hàng trên toàn quốc.
					</p>
					<img src="Images/Introduce/introduce_2.jpg">
					<p>
						NIỀM TIN CỦA YODY<br>
						- Tất cả các khoản chi đều là chi phí, chỉ có chi cho khách hàng và nhân viên là không phí.<br>
						- Tất cả những thành viên của Yody đều nỗ lực hết sức và có năng lực để thực hiện mục tiêu.<br>
						- Mỗi thành viên Yody đều có thể thay đổi khi được trao niềm tin, ghi nhận, hướng dẫn và đào tạo.<br>


						<br>SỨ MỆNH CỦA YODY<br>
						Sứ mệnh của Yody là "Đưa sản phẩm thời trang Việt có chất liệu tốt, dịch vụ tốt đến tận tay khách hàng tại các vùng miền Việt Nam và trên Thế Giới".
					</p>
					<img src="Images/Introduce/introduce_3.jpg">
					<p>
						Yody mong muốn mang đến cho toàn bộ khách hàng trên khắp mọi miền tổ quốc Việt Nam những sản phẩm thời trang do chính tay người Việt làm ra. Không phân biệt tầng lớp, không phân biệt giàu nghèo, những khách hàng chưa bao giờ được trải nghiệm dịch vụ mua sắm vượt ngoài mong đợi, ai cũng sẽ được chào đón, tôn trọng khi đến với Yody.<br>

						<br>Chính vì vậy, Yody dày công nghiên cứu chất liệu sản phẩm và cho ra mắt những dòng sản phẩm tối ưu cả về giá cả và chất lượng mang đến cho khách hàng. Cùng với đó, Yody luôn dành phần lớn thời gian để đào tạo văn hóa phục vụ cho toàn bộ nhân viên. Mỗi nhân viên sẽ là 1 đại sứ thương hiệu, mỗi nhân viên sẽ là 1 hình mẫu về văn hóa phục vụ của Yody và trao giá trị tốt nhất đến từng khách hàng.<br>



						<br>GIÁ TRỊ CỐT LÕI CỦA YODY<br>
						Ở Yody, chúng tôi luôn gìn giữ 6 Giá Trị Cốt Lõi để mọi bước đi đều thêm vững chắc và giàu giá trị.<br>

						<br>1. Đam mê phục vụ khách hàng
						- Luôn đặt sự hài lòng của khách hàng là ưu tiên số 1 trong mọi suy nghĩ và hành động của mình.<br>
						- Luôn Chủ động, Cười, Chào, Cảm ơn.<br>
						
						<br>2. Coi mình là gốc rễ của mọi vấn đề<br>
						- Là một sự lựa chọn để từ đó bạn có sức mạnh để thay đổi kết quả.<br>
						- Là bạn đã từ bỏ quyền coi mình là nạn nhân (Từ bỏ quyền đổ lỗi, chỉ trích, than phiền).<br>
						
						<br>3. Integrity<br>
						- Hoàn tất lời hứa của mình.<br>
						- Khi đã nỗ lực hết sức mà thấy nguy cơ không thể giữ lời thì ngay lập tức thông tin cho những người có liên quan, chịu trách nhiệm, dọn dẹp hậu quả và đưa ra lời hứa mới.<br>
						
						<br>4. Trung thực<br>
						- Về mặt tiền bạc: Không lấy, không sử dụng và không nghĩ đến việc chiếm hữu tiền bạc, hàng hoá, tài sản không phải của mình.<br>
						- Trong các mối quan hệ: Không nói dối, không nói xấu, không bằng mặt  nhưng không bằng lòng.<br>
						- Trong công việc: Báo cáo đúng, đủ trạng thái công việc.<br>
						
						<br>5. Cầu tiến<br>
						- Sẵn sàng thử nghiệm phương pháp mới, chấp nhận thất bại và tiếp tục hành động.<br>
						- Luôn "Say YES", hành động quyết liệt và tin tưởng sẽ đạt được mục tiêu thách thức.<br>
						
						<br>6. Yêu thương và hỗ trợ đồng đội<br>
						a) Thành thật quan tâm đến đồng đội:<br>

						Sẵn lòng hỗ trợ, hướng dẫn, động viên để họ hoàn thành tốt công việc; Không làm thay, không bao che.<br>
						b) Nghe và nói truyền sức mạnh:<br>

						NGHE: Đứng vào vị trí của người nói để lắng nghe đầy đủ và không thành kiến.<br>
						NÓI: Thẳng thắn theo hướng đóng góp xây dựng, luôn ghi nhận thành quả hoặc nỗ lực dù chưa có thành quả.<br>

						<br>TẦM NHÌN CỦA YODY<br>
						- 2025: Công ty thời trang số 1 Việt Nam. IPO và trở thành "Kỳ lân" tiếp theo của Việt Nam. Cộng đồng Yody có cuộc sống viên mãn, hạnh phúc.<br>
						- 2038: Công ty thời trang số 1 Thế Giới. Cộng đồng Yody có cuộc sống viên mãn, hạnh phúc.<br>
					</p>
					<img src="Images/Introduce/introduce_4.jpg">
					<p>HÀNH TRÌNH CỦA YODY QUA CÁC NĂM</p>
					<img src="Images/Introduce/introduce_5.jpg">
				  <p>
						Năm 2014: Thương hiệu Yody ra đời<br>
						- 25/4/2014: Khai trương cửa hàng Yody đầu tiên tại 22 Chùa Bộc – Hà Nội.<br>
						- 14/7/2014 : Khai trương cửa hàng Yody thứ 2 tại Chí Linh.<br>
						- 26/10/2014: Khai trương cửa hàng Yody thứ 3 tại Kẻ Sặt.<br>
						- 20/10/2014: Khai trương cửa hàng Yody thứ 4 tại Bắc Giang.<br>
						- Năm 2014 cũng là năm với sự góp mặt của các thành viên: Chị Thanh, chị Huế, chị Ngân, chị Thêu, chị Nguyệt… đến giờ vẫn đang đồng hành cùng Yody.<br>
						- Hoạt động đào tạo, chia sẻ trở thành một phần văn hoá không thể thiếu của Yody.<br>
					  
						<br>Năm 2015: Yody tìm được văn phòng “mơ ước”<br>
						- 09/4/2015: CEO Nguyễn Việt Hòa vẫn mơ về một văn phòng khang trang, tràn đầy cảm hứng cho đội ngũ Yody. Và rồi đội ngũ Yody cũng đã biến mong muốn về văn phòng ấy thành hiện thực. Văn phòng “Ước mơ” đã được tìm thấy và chính thức khai trương tại 45 Hồng Quang – TP Hải Dương.<br>
						- Yody đón nhận thêm các thành viên cốt cán, gắn bó: anh Hiếu, chị Mận, chị Trang, chị Hạnh…<br>
						- Năm 2015: Thương hiệu Yody đã có 12 cửa hàng.<br>
					  
						<br>Năm 2016: Sự nhiệt huyết & đột phá<br>
						Câu chuyện về niềm đam mê Thời trang Việt trở nên sục sôi hơn khi CEO Nguyễn Việt Hòa cùng đội ngũ Leader ra nước ngoài, bước chân vào các trung tâm thương mại lớn chưa có 1 hãng thời trang Việt Nam nào xuất hiện nhưng sản phẩm "made in Vietnam" lại vô cùng phổ biến. Đây là niềm đau và cũng là động lực, lý do vì sao CEO Nguyễn Việt Hòa muốn đưa sản phẩm thời trang Việt vươn ra Thế giới.<br>

						- 28/4/2016: Yody tiến vào nội thành Hà Nội, khai trương tại 193 Bà Triệu (160m2).<br>
						- Năm 2016 với sự phát triển nhanh chóng Yody đã có 38 cửa hàng trên 20 tỉnh thành của Việt Nam.<br>
					  
						<br>Năm 2017: Yody thử nghiệm mô hình mới<br>
						- Thành lập công ty con Yody Miền Trung (6 cửa hàng)<br>
						- 17/12/2017: Sự kiện Yody Fashion Show hoành tráng được kỳ công đầu tư tổ chức tại TP. Hải Dương với sự tham gia của 1500 khách hàng.<br>
						- Năm 2017, Yody triển khai mô hình siêu thị thời trang, điển hình như: Yody Gia Lộc, Yody Kinh Môn, Yody Quế Võ với diện tích 500m2 – 600m2.<br>
						- Năm 2017, Yody đã có 63 cửa hàng trên 30 tỉnh thành.<br>
						- CEO Nguyễn Việt Hòa dành 11 ngày đi nghiên cứu thị trường tại Nhật Bản và quyết định sẽ sử dụng công nghệ Nhật Bản cho nhà máy sản xuất của Yody sau này.<br>
					  
						<br>Năm 2018: Nâng tầm chất lượng sản phẩm<br>
						- Ban giám đốc của Yody đi nước ngoài nghiên cứu nhà máy vải, đối tác công nghệ cao tại Nhật Bản và một số nước khác.<br>
						- Khánh thành trụ sở & Nhà máy sản xuất Yody với nguồn cảm hứng: “Khơi nguồn sáng tạo – Tiến bước năm châu”.<br>
						- Năm 2018, Yody có 73 cửa hàng và vẫn đang trên đà phát triển.<br>
					  
						<br>Năm 2019: Bước đà đột phá<br>
						- Yody hiện đã có 91 cửa hàng trải khắp 33 tỉnh thành trên toàn quốc với quy mô trên 700 nhân sự.<br>
						- Yody chuẩn bị các bước để năm 2020 gấp đôi số lượng cửa hàng và mở thêm 1 cửa hàng tại nước ngoài.<br>
					  
						<br>Năm 2020: Đột phá<br>
						- Yody tiến bước đến với Miền Nam.
						- Đưa Yody ra thế giới với những sản phẩm đầu tiên được bán ra thị trường Mỹ.<br>
						- 16/12/2020: Khai trương cửa hàng Yody Bắc Giang lớn nhất Đông Nam Á.<br>
					  
						<br>Năm 2021: Bức tốc<br>
						- 18/3/2021: Yody ra mắt dòng sản phẩm Everyday Wear 2021 cùng Trường Giang - Nhã Phương với chất liệu độc quyền tại Việt Nam là áo polo cafe, áo polo mắt chim, áo polo pima, áo polo airycool, áo polo coolmax.<br>
						- 10/4/2021: Chính thức đưa văn phòng Yody Hà Nội vào hoạt động.<br>


						<br>Với sứ mệnh đưa Yody thành thương hiệu thời trang toàn cầu, đội ngũ các thành viên Yody cam kết sẽ mang lại sự hài lòng tuyệt đối về sản phẩm cũng như dịch vụ đến tận tay khách hàng.
					</p>
				</div>
			</section>
		</article>
	</div>
	
	<footer>
		<div class="footer">
			<div class="left-footer">
				<div class="slogan">
					“Đặt sự hài lòng của khách hàng là ưu tiên số 1 trong mọi suy nghĩ hành động của mình” là sứ mệnh, là triết lý, chiến lược.. luôn cùng YODY tiến bước"
				</div>
				<div class="get-information">
					<p>ĐĂNG KÝ NHẬN THÔNG TIN</p>
					<div class="get-email">
						<input type="email" placeholder="Nhập email đăng ký của bạn">
						<a href="#"><input type="button" value="Đăng ký"></a>
					</div>
				</div>
				<div class="social-media-logo">
					<a href="#"><img src="Images/social%20media/facebook.png"></a>
					<a href="#"><img src="Images/social%20media/reddit.png"></a>
					<a href="#"><img src="Images/social%20media/twitter.png"></a>
					<a href="#"><img src="Images/social%20media/youtube.png"></a>
					<a href="#"><img src="Images/social%20media/tumblr.png"></a>
				</div>
			</div>
			<div class="middle-footer-1">
				<ul>
					<font color="Gray">VỀ YODY</font>
					<a href="#"><li>Giới thiệu</li></a>
					<a href="#"><li>Liên hệ</li></a>
					<a href="#"><li>Tuyển dụng</li></a>
					<a href="#"><li>Tin tức</li></a>
					<a href="#"><li>Hệ thống cửa hàng</li></a>
				</ul>
			</div>
			<div class="middle-footer-2">
				<ul>
					<font color="Gray">HỖ TRỢ KHÁCH HÀNG</font>
					<a href="#"><li>Hướng dẫn chọn size</li></a>
					<a href="#"><li>Chính sách khách hàng thân thiết</li></a>
					<a href="#"><li>Chính sách đổi/trả</li></a>
					<a href="#"><li>Chính sách bảo mật</li></a>
					<a href="#"><li>Thanh toán, giao nhận</li></a>
				</ul>
			</div>
			<div class="right-footer">
				<p>
					Công ty cổ phần Thời trang YODY<br>
					Mã số thuế: 0801206940<br>
					Địa chỉ: Đường An Định - Phường Việt Hoa - Thành phố Hải Dương - Hải dương
				</p>
				<p>
					Liên hệ đặt hàng: 024 730 56665<br>
					Thắc mắc đơn hàng: 024 730 16661<br>
					Góp ý khiếu nại: 1800 2086
				</p>
				<p>
					Email: chamsockhachhang@yody.vn
				</p>
			</div>
		</div>
	</footer>
</body>
</html>