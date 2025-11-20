import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_crud/main.dart'; // Đường dẫn tới main.dart

void main() {
  group('Counter Widget Tests', () {

    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      // Render toàn bộ app
      await tester.pumpWidget(const MyApp());

      // Kiểm tra giá trị ban đầu
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Nhấn nút + 1 lần
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle(); // đảm bảo widget tree update xong

      // Kiểm tra counter đã tăng
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Counter increments twice', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Kiểm tra giá trị ban đầu
      expect(find.text('0'), findsOneWidget);

      // Nhấn nút + hai lần
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Kiểm tra counter = 2
      expect(find.text('0'), findsNothing);
      expect(find.text('2'), findsOneWidget);
    });
  });
}
