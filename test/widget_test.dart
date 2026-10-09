import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_web_service/main.dart';

void main() {
  testWidgets('Tugas dibuka melalui pertemuan dan kembali bertahap', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    const meetings = {
      'Pertemuan 2': {'Detail Mata Kuliah': 'Detail Mata Kuliah'},
      'Pertemuan 3': {
        'Tugas Kelompok': 'Anggota Kelompok',
        'Column & Row': 'Profil Mahasiswa',
        'Network Image': 'Network Image',
        'Image Asset': 'Image Asset',
        'Padding': 'Padding',
      },
    };

    expect(find.byType(ListTile), findsNWidgets(2));
    expect(find.text('Column & Row'), findsNothing);
    expect(find.text('Detail Mata Kuliah'), findsNothing);

    for (final meeting in meetings.entries) {
      await tester.tap(find.widgetWithText(ListTile, meeting.key));
      await tester.pumpAndSettle();
      expect(find.widgetWithText(AppBar, meeting.key), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(meeting.value.length));

      for (final task in meeting.value.entries) {
        final menuItem = find.widgetWithText(ListTile, task.key);
        await tester.ensureVisible(menuItem);
        await tester.tap(menuItem);
        await tester.pump();
        // Tidak menunggu gambar jaringan selesai dimuat.
        await tester.pump(const Duration(milliseconds: 400));

        expect(find.widgetWithText(AppBar, task.value), findsOneWidget);
        expect(find.byType(MaterialApp), findsOneWidget);
        expect(tester.takeException(), isNull);

        await tester.pageBack();
        await tester.pumpAndSettle();
        expect(find.widgetWithText(AppBar, meeting.key), findsOneWidget);
        expect(tester.takeException(), isNull);
      }

      await tester.pageBack();
      await tester.pumpAndSettle();
      expect(
        find.widgetWithText(AppBar, 'Menu Latihan Flutter'),
        findsOneWidget,
      );
    }
  });

  testWidgets('Tombol kembali sistem mengikuti urutan tugas dan pertemuan', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(360, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.tap(find.widgetWithText(ListTile, 'Pertemuan 3'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(ListTile, 'Column & Row'));
    await tester.pumpAndSettle();

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.widgetWithText(AppBar, 'Pertemuan 3'), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.widgetWithText(AppBar, 'Menu Latihan Flutter'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
