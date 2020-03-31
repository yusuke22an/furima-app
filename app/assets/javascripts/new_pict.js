$(function(){
  //DataTransferオブジェクトで、データを格納する箱を作る
  var dataBox = new DataTransfer();
  //querySelectorでfile_fieldを取得
  var file_field = document.querySelector('input[type=file]')
  //fileが選択された時に発火するイベント
  $('#img-file').change(function(){
    //選択したfileのオブジェクトをpropで取得
    var files = $('input[type="file"]').prop('files')[0];
    $.each(this.files, function(i, file){
      //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
      var fileReader = new FileReader();

      //DataTransferオブジェクトに対して、fileを追加
      dataBox.items.add(file)
      //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に代入
      file_field.files = dataBox.files

      var num = $('.item-image').length + 1 + i
      fileReader.readAsDataURL(file);
      //画像が5枚になったら超えたらドロップボックスを削除する
      if (num == 5){
        $('#image-box__container').css('display', 'none')   
      }
      //読み込みが完了すると、srcにfileのURLを格納
      fileReader.onloadend = function() {
        var src = fileReader.result
        var html= `<div class='item-image__delete__box' delete_id="${file.id}">
                  </div>
                  <div class='item-image' data-image="${file.name}">
                    <div class=' item-image__content'> 
                      <div class='item-image__content--icon'>
                        <img src=${src} width="114" height="114" >
                      </div>
                    <div class='item-image__operetion--delete'>
                      <span id="${file.id}">削除</span>
                    </div>
                  </div>`
        //image_box__container要素の前にhtmlを差し込む
        $('#image-box__container').before(html);
        
      };
      //image-box__containerのクラスを変更し、CSSでドロップボックスの大きさを変えてやる。
      $('#image-box__container').attr('class', `item-num-${num}`)
    });
  });
  //削除ボタンをクリックすると発火するイベント
  $(document).on("click", '.item-image__operetion--delete', function(){
    //削除を押されたプレビュー要素を取得
    var target_image = $(this).parent().parent()
    //削除を押されたプレビューimageのfile名を取得
    var target_name = $(target_image).data('image')
    //削除を押されたプレビューと同じIDを持つcheck-boxのONにする

    // 削除ボタンに付与されているidを取得
    // id = "40"
    var id = $(".deleteid_button").attr("value");
    console.log(id)
    // 同じidをもっているチェックボックスを指定する
    var checkbox = $(`input[value="${id}"].deletecheck`);
    // それが存在していたらチェックをいれる
    if(checkbox) checkbox.prop('checked',true)
    console.log(checkbox)
    // 課題①削除ボタンidと同じチェックボックidにチェックいれる

    //プレビューがひとつだけの場合、file_fieldをクリア
    if(file_field.files.length==1){
      //inputタグに入ったファイルを削除
      $('input[type=file]').val(null)
      dataBox.clearData();
    }else{
      //プレビューが複数の場合
      $.each(file_field.files, function(i,input){
        //削除を押された要素と一致した時、index番号に基づいてdataBoxに格納された要素を削除する
        if(input.name==target_name){
          dataBox.items.remove(i) 
        }
      })
      //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に再度代入
      file_field.files = dataBox.files
    }
    //プレビューを削除
    target_image.remove()
    //image-box__containerクラスをもつdivタグのクラスを削除のたびに変更
    var num = $('.item-image').length
    $('#image-box__container').show()
    $('#image-box__container').attr('class', `item-num-${num}`)
  })
});