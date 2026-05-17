# BÁO CÁO LAB 6 - SIMPLE OFFLINE MUSIC APP

## THÔNG TIN SINH VIÊN
- **Họ tên:** Lê Việt Thắng
- **MSSV:** 2224802010263
- **Ngày báo cáo:** 17/05/2026

---

## MỤC LỤC
1. Giới thiệu đề tài
2. Tổng quan dự án
3. Cấu trúc thư mục
4. Tính năng chính
5. Hướng dẫn cài đặt và chạy
6. Hướng dẫn sử dụng (từng bước)
7. Minh họa từng màn hình
8. Kết luận

---

## 1. GIỚI THIỆU ĐỀ TÀI

**Simple Offline Music App** là ứng dụng nghe nhạc offline do em phát triển bằng Flutter. Ứng dụng tập trung vào trải nghiệm phát nhạc cục bộ với giao diện hiện đại, cho phép người dùng duyệt danh sách bài hát, tìm kiếm, phát/tạm dừng, tua bài, chuyển bài, quản lý playlist, điều chỉnh âm lượng/tốc độ phát và lưu trạng thái bằng `SharedPreferences`.

---

## 2. TỔNG QUAN DỰ ÁN

### Công nghệ sử dụng:
- **Flutter** - Framework xây dựng ứng dụng đa nền tảng
- **Provider** - Quản lý trạng thái
- **just_audio** - Xử lý phát nhạc
- **on_audio_query** - Truy vấn danh sách bài hát/metadata từ thiết bị
- **shared_preferences** - Lưu trạng thái cài đặt và dữ liệu đơn giản
- **permission_handler** - Xin quyền truy cập media
- **audio_session** - Quản lý audio session
- **rxdart** - Hỗ trợ stream/reactive programming

### Yêu cầu hệ thống:
- Flutter SDK 3.x trở lên
- Dart SDK 3.x trở lên
- Thiết bị/giả lập hỗ trợ Flutter
- Chrome hoặc Windows nếu chạy bản web/desktop
- File nhạc mẫu trong thư mục `assets/audio/sample_songs/`

### Mục tiêu ứng dụng:
- Em xây dựng ứng dụng nghe nhạc offline cơ bản
- Em hỗ trợ thao tác phát nhạc đầy đủ
- Em tổ chức bài hát theo danh sách và playlist
- Em tối ưu trải nghiệm với mini player và màn hình Now Playing
- Em lưu cài đặt người dùng giữa các lần mở ứng dụng

---

## 3. CẤU TRÚC THƯ MỤC

```text
lib/
+-- main.dart                         # Entry point, khai báo Provider và MaterialApp
+-- models/                           # Các model dữ liệu bài hát/playlist
+-- providers/
|   +-- audio_provider.dart           # Quản lý trạng thái phát nhạc
|   +-- playlist_provider.dart        # Quản lý playlist
|   +-- theme_provider.dart           # Quản lý giao diện sáng/tối
+-- screens/
|   +-- home_screen.dart              # Màn hình chính
|   +-- all_songs_screen.dart         # Danh sách toàn bộ bài hát
|   +-- now_playing_screen.dart       # Màn hình phát nhạc chi tiết
|   +-- playlist_screen.dart          # Danh sách playlist
|   +-- playlist_detail_screen.dart   # Chi tiết playlist
|   +-- settings_screen.dart          # Cài đặt ứng dụng
+-- services/                         # Tầng xử lý nghiệp vụ/audio/query
+-- utils/
|   +-- constants.dart                # Hằng số dùng chung
|   +-- duration_formatter.dart       # Định dạng thời lượng
|   +-- color_extractor.dart          # Hỗ trợ màu giao diện
|   +-- lyrics_data.dart              # Dữ liệu/phần hỗ trợ lyric
+-- widgets/
    +-- album_art.dart                # Hiển thị ảnh album
    +-- mini_player.dart              # Thanh phát nhạc thu nhỏ
    +-- player_controls.dart          # Cụm nút điều khiển phát nhạc
    +-- playlist_card.dart            # Card playlist
    +-- progress_bar.dart             # Thanh tiến trình
    +-- song_tile.dart                # Item bài hát
```

---

## 4. TÍNH NĂNG CHÍNH

### 4.1 Tính năng cơ bản:
- Hiển thị danh sách bài hát offline
- Phát / tạm dừng bài hát
- Chuyển bài tiếp theo / trước đó
- Tua bài hát bằng progress bar
- Hiển thị thông tin bài hát đang phát
- Màn hình Now Playing riêng

### 4.2 Tính năng nâng cao:
- **Tìm kiếm bài hát** theo tên
- **Lọc / sắp xếp danh sách** để duyệt nhạc thuận tiện hơn
- **Shuffle** phát ngẫu nhiên
- **Repeat** lặp lại bài hát hoặc danh sách
- **Mini Player** để điều khiển nhanh khi chuyển màn hình
- **Playlist** tạo và quản lý nhóm bài hát
- **Điều chỉnh âm lượng**
- **Điều chỉnh tốc độ phát**
- **Lưu trạng thái** bằng `SharedPreferences`
- **Dark/Light Theme** qua `ThemeProvider`

### 4.3 Giao diện:
- Material Design 3
- Bố cục hiện đại, thân thiện
- Hỗ trợ nhiều màn hình chức năng
- Điều hướng rõ ràng giữa Home / Search / Playlist / Settings / Now Playing

---

## 5. HƯỚNG DẪN CÀI ĐẶT VÀ CHẠY

### Bước 1: Mở project
```bash
cd "c:\Users\Admin\Desktop\FLUTER_BAITAP\THUCHANH\lap6_2224802010263_levietthang"
```

### Bước 2: Kiểm tra Flutter
```bash
flutter --version
```

### Bước 3: Cài đặt dependencies
```bash
flutter pub get
```

### Bước 4: Chạy ứng dụng

**Chạy trên Chrome:**
```bash
flutter run -d chrome
```

**Chạy trên Windows Desktop:**
```bash
flutter run -d windows
```

**Chạy trên Android:**
```bash
flutter run -d android
```

### Bước 5: Chuẩn bị dữ liệu nhạc
- Đảm bảo project có thư mục `assets/audio/sample_songs/`
- Nếu chạy trên thiết bị thật và dùng truy vấn media, cấp quyền truy cập âm thanh khi ứng dụng yêu cầu

---

## 6. HƯỚNG DẪN SỬ DỤNG (TỪNG BƯỚC)

### Bước 1: Mở ứng dụng
- Em khởi động ứng dụng bằng Flutter
- Màn hình chính hiển thị danh sách bài hát và khu vực điều hướng
- Nếu ứng dụng cần quyền truy cập media, em chấp nhận để tải dữ liệu nhạc

### Bước 2: Xem danh sách bài hát
1. Vào màn hình Home hoặc All Songs
2. Danh sách bài hát hiển thị theo từng item
3. Mỗi item có thông tin như tên bài hát, nghệ sĩ hoặc metadata liên quan

### Bước 3: Tìm kiếm bài hát
1. Mở khu vực tìm kiếm
2. Nhập tên bài hát hoặc từ khóa
3. Danh sách cập nhật theo kết quả phù hợp

### Bước 4: Phát nhạc
1. Nhấn vào bài hát bất kỳ trong danh sách
2. Ứng dụng bắt đầu phát bài hát
3. Mini player xuất hiện ở cạnh dưới để điều khiển nhanh

### Bước 5: Điều khiển phát nhạc
1. Nhấn **Pause/Play** để tạm dừng hoặc phát tiếp
2. Nhấn **Next** để chuyển bài kế tiếp
3. Nhấn **Previous** để quay lại bài trước
4. Kéo **Progress Bar** để tua đến vị trí mong muốn

### Bước 6: Mở màn hình Now Playing
1. Nhấn vào mini player hoặc bài hát đang phát
2. Màn hình **Now Playing** hiển thị:
   - Ảnh album
   - Tên bài hát
   - Thanh tiến trình
   - Các nút điều khiển chính
   - Trạng thái shuffle / repeat

### Bước 7: Dùng playlist
1. Mở màn hình **Playlist**
2. Xem danh sách playlist hiện có
3. Chọn playlist để xem chi tiết bài hát bên trong
4. Phát bài hát trực tiếp từ playlist

### Bước 8: Mở cài đặt
1. Vào màn hình **Settings**
2. Điều chỉnh âm lượng
3. Điều chỉnh tốc độ phát
4. Thay đổi giao diện sáng/tối nếu ứng dụng hỗ trợ tùy chọn này

### Bước 9: Tiếp tục sử dụng
- Ứng dụng lưu một số trạng thái bằng `SharedPreferences`
- Khi mở lại, cài đặt trước đó vẫn được giữ lại

---

## 7. MINH HỌA TỪNG MÀN HÌNH

### Hình 1. Màn hình giao diện chính của ứng dụng
![Hình 1 - Giao diện chính](../../../FLUTER_THUCHANH/lap6_2224802010263_levietthang/images/Hinh1.jpg)

*Hình 1 minh họa giao diện tổng quan của ứng dụng Simple Offline Music App do em xây dựng khi vừa mở, gồm khu vực danh sách nhạc, thanh điều hướng và bố cục chính của chương trình.*

### Hình 2. Màn hình chức năng tiếp theo của ứng dụng
![Hình 2 - Màn hình chức năng](../../../FLUTER_THUCHANH/lap6_2224802010263_levietthang/images/Hinh2.jpg)

*Hình 2 thể hiện một màn hình chức năng khác trong quá trình sử dụng ứng dụng, giúp minh họa rõ hơn luồng điều hướng và cách tổ chức giao diện.*

### Hình 3. Màn hình thao tác và điều khiển
![Hình 3 - Màn hình thao tác](../../../FLUTER_THUCHANH/lap6_2224802010263_levietthang/images/Hinh3.jpg)

*Hình 3 minh họa khu vực thao tác liên quan đến phát nhạc, điều khiển và tương tác của người dùng với ứng dụng.*

### Hình 4. Màn hình minh họa bổ sung
![Hình 4 - Màn hình bổ sung](../../../FLUTER_THUCHANH/lap6_2224802010263_levietthang/images/Hinh4.jpg)

*Hình 4 cung cấp thêm một góc nhìn trực quan về ứng dụng, làm rõ bố cục hiển thị và các thành phần chức năng trên giao diện.*

### Nguồn hình ảnh sử dụng trong báo cáo
- Thư mục ảnh tham chiếu: `C:\Users\Admin\Desktop\FLUTER_THUCHANH\lap6_2224802010263_levietthang\images`
- Các tệp ảnh đã dùng:
  - `Hinh1.jpg`
  - `Hinh2.jpg`
  - `Hinh3.jpg`
  - `Hinh4.jpg`

---

## 8. KẾT LUẬN

### Kết quả đạt được:
- Em đã hoàn thành ứng dụng **Simple Offline Music App** theo yêu cầu Lab 6
- Em xây dựng được luồng phát nhạc offline cơ bản và ổn định
- Em tổ chức giao diện thành nhiều màn hình rõ ràng
- Em hỗ trợ tìm kiếm, playlist, now playing và mini player
- Em tích hợp `Provider` để quản lý trạng thái
- Em lưu cài đặt/trạng thái bằng `SharedPreferences`

### Hạn chế:
- Ứng dụng của em vẫn phụ thuộc dữ liệu nhạc cục bộ hoặc quyền truy cập media
- Em chưa có đồng bộ dữ liệu online/cloud
- Em chưa tích hợp lời bài hát động hoặc tải metadata từ internet
- Em chưa có tính năng yêu thích/favorite hoàn chỉnh

### Hướng phát triển:
- Em sẽ bổ sung danh sách yêu thích
- Em sẽ hỗ trợ lời bài hát đồng bộ thời gian
- Em sẽ thêm bộ lọc nâng cao theo nghệ sĩ/album/thể loại
- Em sẽ đồng bộ playlist lên cloud
- Em sẽ cải thiện giao diện desktop/mobile riêng biệt
- Em sẽ tối ưu hiệu năng khi danh sách bài hát lớn

---

## TÀI LIỆU THAM KHẢO
- Flutter Documentation: https://docs.flutter.dev/
- just_audio: https://pub.dev/packages/just_audio
- provider: https://pub.dev/packages/provider
- shared_preferences: https://pub.dev/packages/shared_preferences
- on_audio_query: https://pub.dev/packages/on_audio_query
