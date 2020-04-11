$(function () {
  // ユーザーの誕生日の閏年を動的に変化させる
  // 誕生日の配列を宣言
  var year_of_birth = [];
  var month_of_birth = [];
  var months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  // 現在の年を取得する
  var date = new Date();
  var this_year = date.getFullYear();
  var oldest_year = 1900;

  // 誕生年月の配列を自動生成
  for (var i = this_year; i >= oldest_year; i--) {
    var year = { var: i, txt: String(i) };
    year_of_birth.push(year);
  }
  for (var i = 1; i <= 12; i++) {
    var month = { var: i, txt: String(i) };
    month_of_birth.push(month);
  }
  // hamlの年と月のセレクトボックスに配列内容を反映させる
  for (var i = 0; i < year_of_birth.length; i++) {
    $("<option>", {
      value: year_of_birth[i].var,
      text: year_of_birth[i].txt
    }).appendTo('#select_year_of_birth');
  }
  for (var i = 0; i < month_of_birth.length; i++) {
    $("<option>", {
      value: month_of_birth[i].var,
      text: month_of_birth[i].txt
    }).appendTo('#select_month_of_birth');
  }

  // 年、もしくは月のセレクトボックスの中身に変更があったら日の内容を変更する
  $('#select_year_of_birth, #select_month_of_birth').change(function () {
    // 日が入っているセレクトボックスの中身を空っぽにする
    $('#select_day_of_birth').empty();
    // 日が入るセレクトボックスにデフォルト値の'--'を入れる
    $("<option>", {
      text: '--'
    }).appendTo('#select_day_of_birth');
    // ２月の日にち、すなわちmonths[1]を28にセットし直す
    months[1] = 28;
    //年と月に入力されている情報を取得する
    var year = $('#select_year_of_birth').val();
    var month = $("#select_month_of_birth").val();
    // yearとmonth共に数字が入力されている、すなわち共に'--'でないときに実行
    if (year != '--' && month != '--') {
      // monthに２月が選択されている時実行
      if (month == 2) {
        // yearが閏年の時、2月の日付が格納されているmonths[1]の値を29にする
        if ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)) {
          months[1] = 29;
        }
      }
      // 日を入れる配列を宣言し、閏年を考慮したデータを格納してhamlの日の
      // セレクトボックスに反映させる
      var day_of_birth = []
      for (var i = 1; i <= months[month - 1]; i++) {
        var day = { var: i, txt: String(i) };
        day_of_birth.push(day);
      }
      for (var i = 0; i < day_of_birth.length; i++) {
        $("<option>", {
          value: day_of_birth[i].var,
          text: day_of_birth[i].txt
        }).appendTo('#select_day_of_birth');
      };
    };
  });
});