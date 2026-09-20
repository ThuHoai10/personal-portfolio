import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoai_portfolio/main.dart';

void main() {
  testWidgets('Thẻ thông tin cá nhân hiển thị đầy đủ các thành phần UI và widget yêu cầu', (WidgetTester tester) async {
    // Cài đặt kích thước màn hình test đủ lớn để hiển thị toàn bộ nội dung
    tester.view.physicalSize = const Size(800, 1600);
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
    expect(find.textContaining('Công nghệ Thông tin'), findsWidgets);

    // 4. Kiểm tra Số điện thoại, Email, Địa chỉ
    expect(find.text('0963674498'), findsOneWidget);
    expect(find.text('thuhoai2005@gmail.com'), findsOneWidget);
    expect(find.text('Xã Liên Minh, Thành phố Hà Nội'), findsOneWidget);

    // 5. Kiểm tra GitHub
    expect(find.text('github.com/thuhoai2005'), findsOneWidget);

    // 6. Kiểm tra các widget trọng tâm của bài học:
    // - CircleAvatar (Ảnh đại diện tròn)
    expect(find.byType(CircleAvatar), findsWidgets);

    // - Card (Các thẻ thông tin liên hệ nổi)
    expect(find.byType(Card), findsWidgets);

    // - Icon (Các biểu tượng phone, email, location...)
    expect(find.byType(Icon), findsWidgets);

    // - Column & Row (Hệ thống layout trục dọc và trục ngang)
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Row), findsWidgets);

    // - Padding & SizedBox (Box Model spacers)
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(SizedBox), findsWidgets);
  });
}
