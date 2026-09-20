import 'package:flutter/material.dart';

/// ============================================================================
/// TRỌNG TÂM BÀI HỌC VỀ GIAO DIỆN & BỐ CỤC (LAYOUT & BOX MODEL) TRONG FLUTTER:
/// 1. [Container]: Khối hộp đa năng kết hợp kích thước, padding, margin, màu nền, viền và đổ bóng.
/// 2. [Padding]: Vùng đệm bên trong của Box Model giúp tạo khoảng cách an toàn, tránh dính sát mép.
/// 3. [Column]: Bố cục sắp xếp các widget con theo TRỤC DỌC (Vertical Axis).
/// 4. [Row]: Bố cục sắp xếp các widget con theo TRỤC NGANG (Horizontal Axis).
/// 5. Giao diện tĩnh sử dụng [StatelessWidget] nhằm tối ưu hiệu năng và mã nguồn trong sáng.
/// ============================================================================

/// [PortfolioPage] là một [StatelessWidget].
/// - Điểm đặc trưng: Giao diện tĩnh, hiển thị hồ sơ cá nhân hoàn chỉnh.
/// - Hiệu năng cao: Không tiêu tốn tài nguyên quản lý trạng thái, tập trung 100% vào hệ thống Layout.
class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  // --- DỮ LIỆU THÔNG TIN CÁ NHÂN & GIỚI THIỆU ---
  final String fullName = 'Nguyễn Thị Thu Hoài';
  final String occupation = 'Sinh viên';
  final String subDescription = 'Đam mê Lập trình Di động & Thiết kế UI/UX';
  final String university = 'Sinh viên Năm 4 - Đại học';
  final String major = 'Kỹ thuật phần mềm';
  final String bio =
      'Xin chào! Mình là Thu Hoài, sinh viên năm 4 chuyên ngành Kỹ thuật phần mềm thuộc Đại học Thủy Lợi.';
  final String phoneNumber = '0963674498';
  final String email = 'thuhoai2005@gmail.com';
  final String address = 'Xã Liên Minh, Thành phố Hà Nội';
  final String gender = 'Nữ';
  final String birthYear = '2005';
  final String github = 'github.com/ThuHoai10';

  // --- DỮ LIỆU KỸ NĂNG (SKILLS) ---
  final List<Map<String, dynamic>> skillsList = const [
    {
      'name': 'Phân tích yêu cầu',
      'icon': Icons.analytics_outlined,
      'color': Color(0xFF7C3AED), // Tím phong cách
    },
    {
      'name': 'Python',
      'icon': Icons.terminal_rounded,
      'color': Color(0xFF0284C7), // Xanh dương Python
    },
    {
      'name': 'HTML',
      'icon': Icons.html_rounded,
      'color': Color(0xFFEA580C), // Cam HTML5
    },
    {
      'name': 'CSS',
      'icon': Icons.css_rounded,
      'color': Color(0xFF2563EB), // Xanh lam CSS3
    },
    {
      'name': 'Flutter & Dart',
      'icon': Icons.flutter_dash,
      'color': Color(0xFF0D9488), // Xanh ngọc Flutter
    },
    {
      'name': 'Git & GitHub',
      'icon': Icons.code_rounded,
      'color': Color(0xFF334155), // Xám tối GitHub
    },
  ];

  // --- DỮ LIỆU KINH NGHIỆM (EXPERIENCE) ---
  final String experienceStatus = 'Chưa có';
  final String experienceDescription =
      'Hiện tại mình chưa có kinh nghiệm làm việc thực tế tại doanh nghiệp. Đang chủ động trau dồi năng lực thông qua các bài tập lớn, đồ án chuyên ngành và nghiên cứu công nghệ.';

  // --- DỮ LIỆU DỰ ÁN ĐÃ LÀM (PROJECTS) ---
  final List<Map<String, dynamic>> projectsList = const [
    {
      'title': 'Quản lý phòng tập gym',
      'category': 'Hệ thống Quản lý • Database',
      'description':
          'Xây dựng phần mềm quản lý học viên, quản lý gói tập, theo dõi điểm danh hội viên và lập báo cáo doanh thu định kỳ cho phòng gym.',
      'icon': Icons.fitness_center_rounded,
      'color': Color(0xFFEA580C),
    },
    {
      'title': 'Chatbot hỏi đáp tài liệu',
      'category': 'Python • AI / NLP • Trợ lý ảo',
      'description':
          'Trợ lý ảo thông minh hỗ trợ xử lý ngôn ngữ tự nhiên, tự động đọc hiểu tài liệu và giải đáp thắc mắc người dùng nhanh chóng, chính xác.',
      'icon': Icons.smart_toy_rounded,
      'color': Color(0xFF0D9488),
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Lấy thông tin theme hiện tại của ứng dụng
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Scaffold(
      // [Scaffold]: Cung cấp khung sườn chuẩn Material Design cho màn hình
      backgroundColor: const Color(0xFFF0F2F8),

      // [SafeArea]: Bảo vệ giao diện không bị tai thỏ, phần khuyết đỉnh (notch) hay thanh điều hướng che mất
      body: SafeArea(
        // [Center]: Căn giữa toàn bộ giao diện theo cả trục ngang và trục dọc màn hình
        child: Center(
          // [SingleChildScrollView]: Cho phép cuộn linh hoạt khi danh sách dài hoặc xoay ngang màn hình,
          // ngăn chặn hoàn toàn hiện tượng lỗi tràn viền (RenderFlex overflowed / Pixel Overflow).
          child: SingleChildScrollView(
            // [Padding] của SingleChildScrollView: Tạo khoảng đệm cách mép màn hình ngoài cùng (ngang 20, dọc 24)
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),

            // ================================================================
            // [Container] KHỐI THẺ CHÍNH (MAIN CARD CONTAINER):
            // - Đóng vai trò là khối hộp trung tâm (Box Model) bao bọc toàn bộ nội dung Portfolio.
            // - [constraints]: Giới hạn bề rộng tối đa (maxWidth: 520px) giúp hiển thị đẹp mắt,
            //   chuẩn mực trên cả màn hình di động, máy tính bảng lẫn máy tính để bàn (Web/Desktop).
            // - [padding]: Tạo vùng đệm 24px bên trong từ đường viền đến nội dung con.
            // - [decoration]: Định dạng hình ảnh khối hộp: nền trắng, bo góc 24px và hiệu ứng đổ bóng mềm (boxShadow).
            // ================================================================
            child: Container(
              constraints: const BoxConstraints(maxWidth: 520),
              // [Padding]: Vùng đệm 24px đồng đều ở cả 4 cạnh bên trong Container
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.0), // Bo tròn góc viền khối hộp
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: const Offset(0, 8), // Hướng đổ bóng xuống dưới tạo chiều sâu
                  ),
                ],
              ),

              // ==============================================================
              // [Column] CHÍNH CỦA TOÀN BỘ TRANG PORTFOLIO:
              // - Bố cục sắp xếp các khối thành phần con theo TRỤC DỌC (từ trên xuống dưới).
              // - [mainAxisSize: MainAxisSize.min]: Chỉ co giãn chiều cao vừa đủ theo tổng nội dung con,
              //   không chiếm tràn toàn bộ khoảng trống vô ích.
              // - [crossAxisAlignment: CrossAxisAlignment.center]: Căn giữa các khối con theo trục ngang (trục phụ).
              // ==============================================================
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ==========================================================
                  // 1. ẢNH ĐẠI DIỆN VỚI CIRCLEAVATAR (Avatar tròn)
                  // ==========================================================
                  CircleAvatar(
                    radius: 56.0,
                    backgroundColor: primaryColor.withValues(alpha: 0.25),
                    child: const CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),
                    ),
                  ),

                  // [SizedBox]: Tạo khoảng cách trống cố định 16px theo chiều dọc
                  const SizedBox(height: 16.0),

                  // ==========================================================
                  // 2. HỌ VÀ TÊN (TEXT NỔI BẬT)
                  // ==========================================================
                  Text(
                    fullName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1E293B),
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 6.0),

                  // ==========================================================
                  // 3. NGHỀ NGHIỆP & CHỨC DANH (BADGE CONTAINER)
                  // - [Container]: Định hình khối huy hiệu với nền tím nhạt, bo góc hình viên thuốc tròn.
                  // - [padding]: Tạo vùng đệm ngang 14px, dọc 5px tạo sự thanh thoát cho chữ bên trong.
                  // ==========================================================
                  Container(
                    // [Padding] bên trong Container huy hiệu nghề nghiệp
                    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20.0), // Bo tròn tối đa dạng viên thuốc
                    ),
                    child: Text(
                      occupation.toUpperCase(),
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        color: primaryColor,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8.0),

                  // Mô tả ngắn gọn định hướng bản thân
                  Text(
                    subDescription,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13.5,
                      color: Color(0xFF64748B),
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 16.0),

                  // ==========================================================
                  // 4. ĐƯỜNG PHÂN CÁCH (DIVIDER ĐƯỢC GIỚI HẠN BẰNG SIZEDBOX)
                  // ==========================================================
                  const SizedBox(
                    width: 180.0,
                    child: Divider(
                      thickness: 1.2,
                      color: Color(0xFFE2E8F0),
                    ),
                  ),

                  const SizedBox(height: 14.0),

                  // ==========================================================
                  // 5. THẺ GIỚI THIỆU BẢN THÂN (ABOUT ME)
                  // - Minh họa sự lồng ghép cấu trúc: Card ➔ Padding ➔ Column ➔ [Row, Text]
                  // ==========================================================
                  Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    color: const Color(0xFFF8FAFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
                    ),
                    // [Padding]: Tạo khoảng cách lề trong 16px cho nội dung thẻ Card
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      // [Column]: Bố cục dọc xếp hàng tiêu đề lên trước, mô tả xuống dưới
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // [Row]: Xếp biểu tượng icon và dòng chữ tiêu đề nằm ngang cạnh nhau
                          Row(
                            children: [
                              Icon(
                                Icons.person_pin_rounded,
                                color: primaryColor,
                                size: 22.0,
                              ),
                              const SizedBox(width: 8.0), // Khoảng cách trống giữa Icon và Text
                              const Text(
                                'Giới thiệu bản thân',
                                style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),

                          // Nội dung tiểu sử chi tiết
                          Text(
                            bio,
                            style: const TextStyle(
                              fontSize: 13.0,
                              color: Color(0xFF475569),
                              height: 1.55,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ==========================================================
                  // 6. THẺ KỸ NĂNG (SKILLS) - YÊU CẦU MỚI: Phân tích yêu cầu, Python, HTML, CSS...
                  // - Minh họa: Card ➔ Padding ➔ Column ➔ [Row tiêu đề, Wrap danh sách kỹ năng]
                  // - Từng chip kỹ năng dùng Container và Row nhỏ bên trong.
                  // ==========================================================
                  Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    color: const Color(0xFFF8FAFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
                    ),
                    // [Padding]: Đệm viền trong 16px bao trọn khối danh sách kỹ năng
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      // [Column]: Xếp chồng theo chiều dọc: Hàng tiêu đề ở trên, các chip kỹ năng ở dưới
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // [Row]: Tiêu đề mục kỹ năng (Icon + Chữ nằm trên cùng một hàng ngang)
                          Row(
                            children: [
                              const Icon(
                                Icons.psychology_rounded,
                                color: Color(0xFF7C3AED), // Màu tím sáng tạo
                                size: 22.0,
                              ),
                              const SizedBox(width: 8.0),
                              const Text(
                                'Kỹ năng (Skills)',
                                style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12.0),

                          // [Wrap]: Bố cục tự động rớt dòng khi các thẻ kỹ năng vượt quá chiều ngang màn hình
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: skillsList.map((skill) {
                              return _buildSkillChip(
                                skill['name'] as String,
                                skill['icon'] as IconData,
                                skill['color'] as Color,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ==========================================================
                  // 7. THẺ KINH NGHIỆM (EXPERIENCE) - YÊU CẦU MỚI: Kinh nghiệm: chưa có
                  // - Cấu trúc lồng ghép: Card ➔ Padding ➔ Column ➔ [Row tiêu đề, Row trạng thái & Container badge, Text mô tả]
                  // ==========================================================
                  Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    color: const Color(0xFFF8FAFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
                    ),
                    // [Padding]: Tạo không gian đệm 16px bên trong thẻ kinh nghiệm
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      // [Column]: Xếp các hàng nội dung kinh nghiệm theo chiều dọc
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // [Row]: Tiêu đề mục kinh nghiệm (Icon + Text nằm ngang)
                          Row(
                            children: const [
                              Icon(
                                Icons.work_outline_rounded,
                                color: Color(0xFF0284C7), // Xanh lam công việc
                                size: 22.0,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Kinh nghiệm (Experience)',
                                style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),

                          // [Row]: Dòng hiển thị trạng thái kinh nghiệm kèm nhãn Container nổi bật
                          Row(
                            children: [
                              // [Container]: Khối hộp nhãn badge thông báo trạng thái kinh nghiệm
                              // Có viền bo góc tròn và màu nền cam nhẹ nhàng
                              Container(
                                // [Padding]: Đệm bên trong khối nhãn badge
                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFF7ED), // Cam sáng dịu mắt
                                  borderRadius: BorderRadius.circular(8.0), // Bo nhẹ các góc
                                  border: Border.all(color: const Color(0xFFFDBA74)), // Đường viền mảnh
                                ),
                                child: Text(
                                  experienceStatus,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFEA580C),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              const Expanded(
                                child: Text(
                                  'Sinh viên đang tích lũy kiến thức',
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF475569),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),

                          // Đoạn văn bản giải thích chi tiết quá trình học tập và rèn luyện
                          Text(
                            experienceDescription,
                            style: const TextStyle(
                              fontSize: 13.0,
                              color: Color(0xFF64748B),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ==========================================================
                  // 8. THẺ DỰ ÁN ĐÃ LÀM (PROJECTS) - YÊU CẦU MỚI: Quản lý phòng tập gym, Chatbot hỏi đáp tài liệu
                  // - Minh họa: Card ➔ Padding ➔ Column ➔ [Row tiêu đề, Các Container khối dự án với Column bên trong]
                  // ==========================================================
                  Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    color: const Color(0xFFF8FAFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
                    ),
                    // [Padding]: Vùng đệm 16px bao bọc xung quanh toàn bộ khối dự án
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      // [Column]: Xếp tiêu đề và danh sách 2 dự án theo thứ tự từ trên xuống dưới
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // [Row]: Tiêu đề mục dự án nằm ngang
                          Row(
                            children: const [
                              Icon(
                                Icons.rocket_launch_rounded,
                                color: Color(0xFFEA580C), // Cam nhiệt huyết / bứt phá
                                size: 22.0,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Dự án đã làm (Projects)',
                                style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12.0),

                          // Render danh sách dự án bằng cách duyệt mảng projectsList
                          ...projectsList.map((project) {
                            return _buildProjectItem(
                              title: project['title'] as String,
                              category: project['category'] as String,
                              description: project['description'] as String,
                              icon: project['icon'] as IconData,
                              accentColor: project['color'] as Color,
                            );
                          }),
                        ],
                      ),
                    ),
                  ),

                  // ==========================================================
                  // 9. THẺ HỌC VẤN & CHUYÊN NGÀNH
                  // - Lồng ghép: Card ➔ Padding ➔ Row [Icon, Expanded ➔ Column [Text bậc học, Text ngành]]
                  // ==========================================================
                  Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    color: const Color(0xFFF8FAFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
                    ),
                    // [Padding]: Tạo khoảng cách lề ngang 16px, dọc 12px cho thẻ học vấn
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      // [Row]: Bố trí Icon Trường học bên trái và Cột thông tin ngành học bên phải
                      child: Row(
                        children: [
                          const Icon(
                            Icons.school_rounded,
                            color: Color(0xFF7C3AED), // Tím đại học
                            size: 24.0,
                          ),
                          const SizedBox(width: 16.0), // Khoảng cách ngang giữa Icon và chữ
                          // [Expanded]: Chiếm trọn không gian còn lại trên hàng ngang để tránh tràn chữ
                          Expanded(
                            // [Column]: Xếp 2 dòng chữ thông tin theo trục dọc
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  university,
                                  style: const TextStyle(
                                    fontSize: 11.0,
                                    color: Color(0xFF94A3B8),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  major,
                                  style: const TextStyle(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E293B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ==========================================================
                  // 10. THẺ SỐ ĐIỆN THOẠI (CARD + PADDING + ROW + EXPANDED + COLUMN)
                  // ==========================================================
                  Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    color: const Color(0xFFF8FAFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
                    ),
                    // [Padding]: Vùng đệm 16px ngang và 12px dọc bên trong thẻ SĐT
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      // [Row]: Xếp biểu tượng Điện thoại và Cột số điện thoại nằm ngang
                      child: Row(
                        children: [
                          const Icon(
                            Icons.phone_rounded,
                            color: Color(0xFF0D9488), // Xanh ngọc liên lạc
                            size: 24.0,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            // [Column]: Xếp nhãn chú thích ở trên và số điện thoại ở dưới
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Số điện thoại liên hệ',
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    color: Color(0xFF94A3B8),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  phoneNumber,
                                  style: const TextStyle(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E293B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ==========================================================
                  // 11. THẺ EMAIL (CARD + PADDING + ROW + EXPANDED + COLUMN)
                  // ==========================================================
                  Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    color: const Color(0xFFF8FAFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
                    ),
                    // [Padding]: Tạo khoảng đệm trong thẻ Email
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      // [Row]: Bố cục trục ngang đưa icon thư tín đi cùng cột địa chỉ email
                      child: Row(
                        children: [
                          const Icon(
                            Icons.email_rounded,
                            color: Color(0xFF2563EB), // Xanh dương hòm thư
                            size: 24.0,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            // [Column]: Sắp xếp tiêu đề phụ và địa chỉ email theo trục dọc
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Email học tập & công việc',
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    color: Color(0xFF94A3B8),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  email,
                                  style: const TextStyle(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E293B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ==========================================================
                  // 12. THẺ ĐỊA CHỈ NƠI Ở (CARD + PADDING + ROW + EXPANDED + COLUMN)
                  // ==========================================================
                  Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    color: const Color(0xFFF8FAFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
                    ),
                    // [Padding]: Tạo vùng đệm ngang 16px, dọc 12px
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      // [Row]: Bố cục trục ngang gồm biểu tượng vị trí và text địa chỉ
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            color: Color(0xFFDC2626), // Đỏ ghim bản đồ
                            size: 24.0,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            // [Column]: Xếp tiêu đề và địa chỉ chi tiết theo chiều dọc
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Địa chỉ nơi ở',
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    color: Color(0xFF94A3B8),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  address,
                                  style: const TextStyle(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E293B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ==========================================================
                  // 13. THẺ THÔNG TIN PHỤ (GIỚI TÍNH & NĂM SINH - CHIA 2 CỘT NGANG)
                  // - Lồng ghép phức hợp: Card ➔ Padding ➔ Row [Cột 1 (Row + Column), Vạch ngăn Container, Cột 2 (Row + Column)]
                  // ==========================================================
                  Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    color: const Color(0xFFF8FAFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
                    ),
                    // [Padding]: Vùng đệm 16px ngang, 12px dọc
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      // [Row]: Hàng ngang lớn chia đều 2 cột thông tin Giới tính và Năm sinh
                      child: Row(
                        children: [
                          // CỘT 1: Giới tính
                          Expanded(
                            // [Row] con bên trong: Đặt Icon giới tính cạnh Cột chữ
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.female_rounded,
                                  color: Color(0xFFDB2777), // Hồng nữ tính
                                  size: 22.0,
                                ),
                                const SizedBox(width: 8.0),
                                Expanded(
                                  // [Column] con: Xếp nhãn và giá trị giới tính theo trục dọc
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Giới tính',
                                        style: TextStyle(
                                          fontSize: 11.0,
                                          color: Color(0xFF94A3B8),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        gender,
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF1E293B),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // [Container]: Vạch kẻ ngăn cách dọc ở giữa 2 cột thông tin
                          // Sử dụng Container với chiều cao 28px, bề rộng 1px và màu xám nhạt
                          Container(
                            height: 28,
                            width: 1,
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            color: const Color(0xFFE2E8F0),
                          ),

                          // CỘT 2: Năm sinh & Tuổi
                          Expanded(
                            // [Row] con bên trong: Đặt Icon lịch cạnh Cột chữ năm sinh
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today_rounded,
                                  color: Color(0xFFD97706), // Vàng hổ phách
                                  size: 20.0,
                                ),
                                const SizedBox(width: 8.0),
                                Expanded(
                                  // [Column] con: Xếp nhãn và năm sinh theo trục dọc
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Năm sinh',
                                        style: TextStyle(
                                          fontSize: 11.0,
                                          color: Color(0xFF94A3B8),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '$birthYear (21 tuổi)',
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF1E293B),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ==========================================================
                  // 14. THẺ GITHUB / DỰ ÁN MÃ NGUỒN (CARD + PADDING + ROW + EXPANDED + COLUMN)
                  // ==========================================================
                  Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    color: const Color(0xFFF8FAFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
                    ),
                    // [Padding]: Khoảng đệm ngang 16px, dọc 12px
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      // [Row]: Biểu tượng mã nguồn và đường dẫn GitHub trên cùng một hàng ngang
                      child: Row(
                        children: [
                          const Icon(
                            Icons.code_rounded,
                            color: Color(0xFF0F172A), // Màu đen mã nguồn GitHub
                            size: 24.0,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            // [Column]: Xếp nhãn và link GitHub theo trục dọc
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'GitHub cá nhân',
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    color: Color(0xFF94A3B8),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  github,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1E293B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20.0),

                  // ==========================================================
                  // 15. FOOTER BẢN QUYỀN & MÔ HÌNH HỌC TẬP
                  // ==========================================================
                  const Text(
                    'Flutter Layout & Box Model • Row • Column • Padding • Container',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11.5,
                      color: Color(0xFF94A3B8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// ==========================================================================
  /// HÀM PHỤ TRỢ: [_buildSkillChip]
  /// - Sử dụng [Container] để tạo khung chip có viền bo tròn, nền bán trong suốt.
  /// - Sử dụng [Padding] để tạo khoảng đệm cân đối (ngang 10px, dọc 6px).
  /// - Sử dụng [Row] với [mainAxisSize: MainAxisSize.min] để gắn Icon và Text nằm ngang cạnh nhau gọn gàng.
  /// ==========================================================================
  Widget _buildSkillChip(String label, IconData icon, Color color) {
    // [Container]: Khối hộp định dạng kích thước, nền, viền và bo góc cho mỗi chip kỹ năng
    return Container(
      // [Padding]: Khoảng cách đệm bên trong chip kỹ năng
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08), // Màu nền đồng điệu với độ mờ 8%
        borderRadius: BorderRadius.circular(8.0), // Bo nhẹ góc 8px
        border: Border.all(color: color.withValues(alpha: 0.25)), // Viền mảnh tinh tế
      ),
      // [Row]: Xếp biểu tượng Icon và Tên kỹ năng theo trục ngang
      child: Row(
        mainAxisSize: MainAxisSize.min, // Chiều rộng chỉ bao quanh vừa vặn nội dung bên trong
        children: [
          Icon(icon, size: 15.0, color: color),
          const SizedBox(width: 6.0), // Khoảng trống giữa Icon và Text
          Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  /// ==========================================================================
  /// HÀM PHỤ TRỢ: [_buildProjectItem]
  /// - Dùng để hiển thị từng thẻ Dự án đã làm (Projects).
  /// - Minh họa: [Container] khối hộp dự án ➔ [Padding] ➔ [Column] ➔ [Row tiêu đề & Icon, Badge loại dự án, Text mô tả]
  /// ==========================================================================
  Widget _buildProjectItem({
    required String title,
    required String category,
    required String description,
    required IconData icon,
    required Color accentColor,
  }) {
    // [Container]: Khối hộp bao bọc toàn bộ thông tin của một dự án đơn lẻ
    return Container(
      // [margin]: Khoảng đệm bên ngoài để tách các dự án cách nhau 8px theo chiều dọc
      margin: const EdgeInsets.only(bottom: 10.0),
      // [Padding]: Vùng đệm 12px bao quanh bên trong thẻ dự án
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white, // Nền trắng nổi trên nền thẻ cha xám nhạt
        borderRadius: BorderRadius.circular(10.0), // Bo tròn góc 10px
        border: Border.all(color: const Color(0xFFE2E8F0)), // Đường viền mảnh xám
      ),
      // [Column]: Xếp chồng các hàng thông tin của dự án từ trên xuống dưới
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // [Row]: Hàng ngang trên cùng chứa Icon nổi bật, Tên dự án và Loại danh mục
          Row(
            children: [
              // [Container]: Khối hộp nhỏ chứa Icon của dự án với nền màu đồng điệu
              Container(
                // [Padding]: Tạo đệm 6px xung quanh Icon
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(icon, size: 18.0, color: accentColor),
              ),
              const SizedBox(width: 10.0),
              // [Expanded]: Cho phép cột tiêu đề mở rộng hết bề ngang còn lại
              Expanded(
                // [Column]: Cột xếp Tên dự án ở trên và Danh mục ở dưới
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      category,
                      style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.w500,
                        color: accentColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),

          // Mô tả chi tiết tính năng và công nghệ của dự án
          Text(
            description,
            style: const TextStyle(
              fontSize: 12.5,
              color: Color(0xFF475569),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}
