import 'package:flutter/material.dart';

/// ============================================================================
/// TRỌNG TÂM BÀI HỌC:
/// 1. Làm chủ hệ thống Layout & Box Model (Mô hình hộp) trong Flutter.
/// 2. Giao diện tĩnh với StatelessWidget: Không quản lý trạng thái phức tạp,
///    tập trung 100% vào việc sắp xếp các khối UI.
/// 3. Các widget nền tảng bắt buộc:
///    - Column: Sắp xếp các khối theo trục dọc (Vertical Axis).
///    - Row: Sắp xếp các khối theo trục ngang (Horizontal Axis).
///    - Container: Khối hộp đa năng (tùy biến kích thước, viền, nền, bóng đổ).
///    - SizedBox: Tạo khoảng cách cố định (spacer) hoặc cố định kích thước.
///    - CircleAvatar: Hiển thị ảnh đại diện bo tròn chuẩn mực.
///    - Icon: Hiển thị biểu tượng trực quan từ Material Icons.
///    - Card: Thẻ nổi theo chuẩn Material Design với hiệu ứng bóng đổ (elevation).
///    - Padding: Tạo khoảng cách đệm bên trong khối hộp.
/// ============================================================================

/// [PortfolioPage] là một [StatelessWidget].
/// - Điểm đặc trưng: Giao diện tĩnh, không thay đổi trạng thái theo thời gian.
/// - Ưu điểm: Hiệu năng cao, code rõ ràng, tập trung thuần túy vào thiết kế Layout.
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

  @override
  Widget build(BuildContext context) {
    // Lấy thông tin theme hiện tại của ứng dụng
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Scaffold(
      // [Scaffold]: Cung cấp khung sườn chuẩn Material Design
      backgroundColor: const Color(0xFFF0F2F8),

      // [SafeArea]: Đảm bảo nội dung không bị che bởi tai thỏ / thanh điều hướng
      body: SafeArea(
        // [Center]: Căn giữa toàn bộ khối thẻ trên màn hình
        child: Center(
          // [SingleChildScrollView]: Cho phép cuộn khi nội dung dài hoặc xoay ngang màn hình,
          // ngăn chặn hoàn toàn lỗi tràn viền giao diện (Pixel Overflow)
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),

            child: Container(
              constraints: const BoxConstraints(maxWidth: 520),
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),

              // [Column]: Xếp chồng các thành phần con từ trên xuống dưới theo TRỤC DỌC
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ==============================================================
                  // 1. ẢNH ĐẠI DIỆN VỚI CIRCLEAVATAR (Avatar tròn)
                  // ==============================================================
                  // [CircleAvatar] lớp ngoài: Tạo vòng tròn viền ngoài sang trọng
                  CircleAvatar(
                    radius: 56.0,
                    backgroundColor: primaryColor.withValues(alpha: 0.25),
                    // [CircleAvatar] lớp trong: Hiển thị trực tiếp ảnh đại diện từ Assets.
                    // LƯU Ý QUAN TRỌNG: Không đặt `child: Icon(...)` ở đây vì trong Flutter,
                    // thuộc tính [child] sẽ được vẽ ĐÈ LÊN TRÊN [backgroundImage], gây lỗi
                    // icon hình người che mất khuôn mặt trong ảnh!
                    child: const CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),
                    ),
                  ),

                  // [SizedBox]: Tạo khoảng cách trống theo chiều dọc (16px)
                  const SizedBox(height: 16.0),

                  // ==============================================================
                  // 2. HỌ VÀ TÊN (TEXT NỔI BẬT)
                  // ==============================================================
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

                  // ==============================================================
                  // 3. NGHỀ NGHIỆP & CHỨC DANH (BADGE CONTAINER)
                  // ==============================================================
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20.0),
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

                  // Mô tả ngắn gọn định hướng
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

                  // ==============================================================
                  // 4. THƯỚC PHÂN CÁCH (DIVIDER GIỚI HẠN BẰNG SIZEDBOX)
                  // ==============================================================
                  const SizedBox(
                    width: 180.0,
                    child: Divider(
                      thickness: 1.2,
                      color: Color(0xFFE2E8F0),
                    ),
                  ),

                  const SizedBox(height: 14.0),

                  // ==============================================================
                  // 5. THẺ GIỚI THIỆU BẢN THÂN (ABOUT ME & TIỂU SỬ CHI TIẾT)
                  // Thể hiện sự lồng ghép: Card ➔ Padding ➔ Column ➔ [Row, Text, Wrap]
                  // ==============================================================
                  Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    color: const Color(0xFFF8FAFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Hàng tiêu đề của mục giới thiệu
                          Row(
                            children: [
                              Icon(
                                Icons.person_pin_rounded,
                                color: primaryColor,
                                size: 22.0,
                              ),
                              const SizedBox(width: 8.0),
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

                          // Nội dung mô tả chi tiết
                          Text(
                            bio,
                            style: const TextStyle(
                              fontSize: 13.0,
                              color: Color(0xFF475569),
                              height: 1.55,
                            ),
                          ),
                          const SizedBox(height: 12.0),

                          // Các huy hiệu kỹ năng (Skill Tags) bằng Wrap & Container
                          Wrap(
                            spacing: 6.0,
                            runSpacing: 6.0,
                            children: [
                              _buildSkillChip('Flutter & Dart', Icons.flutter_dash, primaryColor),
                              _buildSkillChip('UI/UX Layout', Icons.palette_outlined, const Color(0xFF0D9488)),
                              _buildSkillChip('Box Model', Icons.crop_square_rounded, const Color(0xFFD97706)),
                              _buildSkillChip('Git / GitHub', Icons.code_rounded, const Color(0xFF2563EB)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ==============================================================
                  // 6. THẺ HỌC VẤN & CHUYÊN NGÀNH
                  // ==============================================================
                  Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    color: const Color(0xFFF8FAFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.school_rounded,
                            color: Color(0xFF7C3AED), // Màu tím đậm
                            size: 24.0,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
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

                  // ==============================================================
                  // 7. THẺ SỐ ĐIỆN THOẠI (CARD + PADDING + ROW + ICON)
                  // ==============================================================
                  Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    color: const Color(0xFFF8FAFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      // [Row]: Xếp biểu tượng Điện thoại và SĐT nằm ngang cạnh nhau
                      child: Row(
                        children: [
                          const Icon(
                            Icons.phone_rounded,
                            color: Color(0xFF0D9488), // Xanh ngọc
                            size: 24.0,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
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

                  // ==============================================================
                  // 8. THẺ EMAIL (CARD + PADDING + ROW + ICON)
                  // ==============================================================
                  Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    color: const Color(0xFFF8FAFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      // [Row]: Xếp biểu tượng Email và địa chỉ Email nằm ngang cạnh nhau
                      child: Row(
                        children: [
                          const Icon(
                            Icons.email_rounded,
                            color: Color(0xFF2563EB), // Xanh dương
                            size: 24.0,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
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

                  // ==============================================================
                  // 9. THẺ ĐỊA CHỈ NƠI Ở (CARD + PADDING + ROW + ICON)
                  // ==============================================================
                  Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    color: const Color(0xFFF8FAFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            color: Color(0xFFDC2626), // Đỏ địa điểm
                            size: 24.0,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
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

                  // ==============================================================
                  // 10. THẺ THÔNG TIN PHỤ (GIỚI TÍNH & NĂM SINH - CHIA 2 CỘT)
                  // ==============================================================
                  Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    color: const Color(0xFFF8FAFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      // [Row]: Chia đều 2 thông tin theo chiều ngang
                      child: Row(
                        children: [
                          // Cột 1: Giới tính
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.female_rounded,
                                  color: Color(0xFFDB2777),
                                  size: 22.0,
                                ),
                                const SizedBox(width: 8.0),
                                Expanded(
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

                          // Vạch ngăn dọc ở giữa
                          Container(
                            height: 28,
                            width: 1,
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            color: const Color(0xFFE2E8F0),
                          ),

                          // Cột 2: Năm sinh & Tuổi
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today_rounded,
                                  color: Color(0xFFD97706),
                                  size: 20.0,
                                ),
                                const SizedBox(width: 8.0),
                                Expanded(
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

                  // ==============================================================
                  // 11. THẺ GITHUB / DỰ ÁN MÃ NGUỒN
                  // ==============================================================
                  Card(
                    elevation: 1.5,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    color: const Color(0xFFF8FAFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.code_rounded,
                            color: Color(0xFF0F172A),
                            size: 24.0,
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
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

                  // ==============================================================
                  // 12. FOOTER BẢN QUYỀN
                  // ==============================================================
                  const Text(
                    'Flutter Layout & Box Model • StatelessWidget',
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

  /// Hàm phụ trợ tạo các chip kỹ năng nhỏ gọn, đẹp mắt
  Widget _buildSkillChip(String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.0, color: color),
          const SizedBox(width: 5.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
