import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoai_portfolio/main.dart';

void main() {
  testWidgets('Thẻ thông tin cá nhân hiển thị đầy đủ các thành phần UI và widget yêu cầu', (WidgetTester tester) async {
    // Cài đặt kích thước màn hình test đủ lớn để hiển thị toàn bộ nội dung
    tester.view.physicalSize = const Size(800, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    // Dựng widget ứng dụng
    await tester.pumpWidget(const HoaiPortfolioApp());
    await tester.pumpAndSettle();

    // 1. Kiểm tra Họ và tên
    expect(find.text('Nguyễn Thị Thu Hoài'), findsOneWidget);

    // 2. Kiểm tra Nghề nghiệp / Mô tả bản thân
    expect(find.textContaining('SINH VIÊN'), findsWidgets);
    expect(find.textContaining('Lập trình Di động'), findsOneWidget);

    // 3. Kiểm tra mục Giới thiệu chi tiết & Học vấn
    expect(find.text('Giới thiệu bản thân'), findsOneWidget);
    expect(find.textContaining('Thu Hoài, sinh viên năm 4'), findsOneWidget);
    expect(find.textContaining('Kỹ thuật phần mềm'), findsWidgets);

    // 4. Kiểm tra Kỹ năng (Skills)
    expect(find.text('Kỹ năng (Skills)'), findsOneWidget);
    expect(find.text('Phân tích yêu cầu'), findsOneWidget);
    expect(find.text('Python'), findsOneWidget);
    expect(find.text('HTML'), findsOneWidget);
    expect(find.text('CSS'), findsOneWidget);

    // 5. Kiểm tra Kinh nghiệm (Experience)
    expect(find.text('Kinh nghiệm (Experience)'), findsOneWidget);
    expect(find.text('Chưa có'), findsOneWidget);

    // 6. Kiểm tra Dự án đã làm (Projects)
    expect(find.text('Dự án đã làm (Projects)'), findsOneWidget);
    expect(find.text('Quản lý phòng tập gym'), findsOneWidget);
    expect(find.text('Chatbot hỏi đáp tài liệu'), findsOneWidget);

    // 7. Kiểm tra Số điện thoại, Email, Địa chỉ
    expect(find.text('0963674498'), findsOneWidget);
    expect(find.text('thuhoai2005@gmail.com'), findsOneWidget);
    expect(find.text('Xã Liên Minh, Thành phố Hà Nội'), findsOneWidget);

    // 8. Kiểm tra GitHub
    expect(find.text('github.com/ThuHoai10'), findsOneWidget);

    // 9. Kiểm tra các widget trọng tâm của bài học Layout & Box Model:
    // - CircleAvatar (Ảnh đại diện tròn)
    expect(find.byType(CircleAvatar), findsWidgets);

    // - Card (Các thẻ thông tin nổi)
    expect(find.byType(Card), findsWidgets);

    // - Icon (Các biểu tượng trực quan)
    expect(find.byType(Icon), findsWidgets);

    // - Column & Row (Hệ thống layout trục dọc và trục ngang)
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Row), findsWidgets);

    // - Padding & Container (Box Model)
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(Container), findsWidgets);
    expect(find.byType(SizedBox), findsWidgets);
  });
}
