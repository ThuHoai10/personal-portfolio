import 'package:flutter/material.dart';
import 'portfolio_page.dart';

/// ============================================================================
/// HÀM MAIN: Điểm bắt đầu (Entry Point) của mọi ứng dụng Flutter.
/// - [WidgetsFlutterBinding.ensureInitialized()]: Đảm bảo các dịch vụ nền tảng
///   của Flutter đã sẵn sàng trước khi dựng giao diện.
/// - [runApp]: Nhận vào Root Widget (ở đây là HoaiPortfolioApp) và gắn nó
///   lên cây widget (Widget Tree) của ứng dụng.
/// ============================================================================
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HoaiPortfolioApp());
}

/// [HoaiPortfolioApp] là một [StatelessWidget].
/// Widget này chịu trách nhiệm khởi tạo cấu hình tổng thể cho ứng dụng (Theme, Routing, Title...)
/// Vì cấu hình ứng dụng trong bài tập này là tĩnh, việc dùng StatelessWidget giúp:
/// - Tối ưu hiệu năng dựng giao diện.
/// - Giữ cho mã nguồn gọn gàng, trong sáng, dễ học và dễ bảo trì.
class HoaiPortfolioApp extends StatelessWidget {
  const HoaiPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Định nghĩa bảng màu chủ đạo (Seed Color) cho ứng dụng
    const primarySeedColor = Color(0xFF6C63FF); // Tím hiện đại / thanh lịch

    return MaterialApp(
      // Tiêu đề ứng dụng hiển thị trên thanh tác vụ của hệ điều hành
      title: 'Hồ Sơ Cá Nhân - Nguyễn Thị Thu Hoài',

      // Tắt biểu tượng "DEBUG" ở góc phải màn hình
      debugShowCheckedModeBanner: false,

      // Cấu hình Theme (Giao diện) dựa trên chuẩn Material 3 mới nhất của Google
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primarySeedColor,
          brightness: Brightness.light,
          primary: const Color(0xFF6C63FF),
          surface: Colors.white,
        ),
        // Màu nền mặc định cho toàn bộ ứng dụng
        scaffoldBackgroundColor: const Color(0xFFF0F2F8),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF1E293B),
          titleTextStyle: TextStyle(
            color: Color(0xFF1E293B),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      // Màn hình chính đầu tiên được nạp vào là PortfolioPage
      home: const PortfolioPage(),
    );
  }
}
