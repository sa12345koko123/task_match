/* global $*/

$(function(){
    //地域を選択
    $('.area_btn').on('click',function(){
        $('.area_overlay').show();
        $('.pref_area').show();
        var area = $(this).data('area');
        $('[data-list]').hide();
        $('[data-list="' + area + '"]').show();
    });

    //レイヤーをタップ
    $('.area_overlay').on('click',function(){
        prefReset();
    });

    //都道府県をクリック
    $('.pref_list [data-id]').on('click',function(){
        if($(this).data('id')){
            var id = $(this).data('id');
            //このidを使用して行いたい操作をしてください
            //都道府県IDに応じて別ページに飛ばしたい場合はこんな風に書く↓
            //window.location.href = 'https://kinocolog.com/pref/' + id;

            prefReset();
        }
    });

    //表示リセット
    function prefReset(){
        $('[data-list]').hide();
        $('.pref_area').hide();
        $('.area_overlay').hide();
    }
});