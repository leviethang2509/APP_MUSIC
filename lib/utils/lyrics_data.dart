class LyricsData {
  static const Map<String, String> _lyricsByTitle = {
    'Blue Sky': '''
[Verse 1]
Trời xanh mở lối giữa chiều yên gió
Tiếng nhạc khẽ rơi qua hàng cây
Từng nhịp tim nghe như đang hát
Giữ lấy khoảnh khắc hôm nay

[Chorus]
Bay lên cùng mây, theo giấc mơ dài
Giai điệu ngân vang giữa bầu trời rộng
Dù ngày mai có xa đến đâu
Ta vẫn còn nhau trong từng câu hát

[Verse 2]
Con đường quen lấp lánh ánh nắng
Bước chân nhẹ tênh giữa yêu thương
Mỗi lần bài ca này vang lên
Là thêm lần tim thấy vấn vương
''',
    'Sunset': '''
[Verse 1]
Hoàng hôn buông xuống trên vai chiều
Màu nắng tan vào mắt em
Nghe trong tim còn bao điều
Chưa kịp nói giữa êm đềm

[Chorus]
Chiều nay gió mang theo nỗi nhớ
Trôi thật xa qua cuối chân trời
Mình từng mơ về ngày rất đẹp
Như ánh mặt trời sắp buông rơi

[Bridge]
Nếu mai đây đường xa cách lối
Xin giữ giùm nhau chút dịu dàng
Để khi nghe bản nhạc này nữa
Ta biết tim mình từng chứa chan
''',
    'Lofi Chill': '''
[Intro]
Một chút yên bình giữa phố đông
Một chút thảnh thơi trong tiếng lòng

[Verse]
Ngồi nghe nhạc trôi qua ô cửa
Ly cà phê thơm giữa mưa rơi
Bao mệt nhoài theo mây tan biến
Để lại đây khoảng lặng tuyệt vời

[Chorus]
Chill cùng đêm, chill cùng mơ
Cho tâm hồn thôi bâng khuâng chờ
Giai điệu mềm như cơn gió khẽ
Ru bình yên vào từng nhịp thở
''',
  };

  static String getLyrics(String title) {
    return _lyricsByTitle[title] ??
        '''
[Verse 1]
Đây là phần lời mẫu cho bài "$title".
Bạn có thể thay bằng lời thật của từng bài để giống Zing MP3 hơn.

[Chorus]
Giai điệu vang lên, cảm xúc đầy hơn
Tên bài hát hiện cùng phần lyrics
Nghe nhạc và đọc lời ngay trên màn hình
Tạo trải nghiệm trực quan, dễ theo dõi

[Verse 2]
Muốn chuẩn hơn, hãy thêm dữ liệu lời riêng
Theo từng bài trong map LyricsData._lyricsByTitle
''';
  }
}