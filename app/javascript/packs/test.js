var _window = $(window),
    _header = $('nav'),
    heroBottom;
 
_window.on('scroll',function(){     
    heroBottom = $('header').height();
    if(_window.scrollTop() > heroBottom){
           
    }
    else{
        _header.removeClass('fixed');   
    }
});
 
_window.trigger('scroll');

var _window1 = $(window),
    _header1 = $('header'),
    _header2 = $('nav'),
    heroBottom1,
    startPos,
    winScrollTop;
 
_window1.on('scroll',function(){
    winScrollTop = $(this).scrollTop();
    heroBottom1 = $('nav').height();
    if (winScrollTop >= startPos) {
        if(winScrollTop >= heroBottom1){
            _header1.addClass('hide');
            _header2.addClass('fixed');
            _header2.removeClass('move');
        }
    } else {
        _header1.removeClass('hide');
        _header2.addClass('move');
    }
    startPos = winScrollTop;
});
 
_window1.trigger('scroll');

$(function() {
    console.log("test");
});

// チェックボックスの取得
const btn = document.querySelector("#btn-mode");

// チェックした時の挙動
btn.addEventListener("change", () => {
  if (btn.checked == true) {
    // ダークモード
    document.body.classList.remove("light-theme");
    document.body.classList.add("dark-theme");
  } else {
    // ライトモード
    document.body.classList.remove("dark-theme");
    document.body.classList.add("light-theme");
  }
});
/* チェックボックスをクッキーに保存
window.addEventListener('load', function() {
    var c = [
        document.getElementById('btn-mode')
    ];
    var chklist;
    if (document.cookie) {
        chklist = document.cookie.split(",");
    };
    c.forEach(function(ci, i) {
        if (chklist && chklist[i] === 'true') ci.checked = true;
        ci.addEventListener('click', function() {
            var x = [];
            c.forEach(function(cj) {
                x.push(cj.checked);
            });

            var expire = new Date();
            expire.setTime(expire.getTime() + 1000 * 3600 * 24);
            document.cookie = x.join(',') + ',; expires=' + expire.toUTCString();
        });
    }); 
});
*/

document.addEventListener('DOMContentLoaded', function () {
    var contentsList = document.getElementById('toc'); // 目次を追加する先(table of contents)
    var div = document.createElement('div'); // 作成する目次のコンテナ要素

    // .entry-content配下のh2、h3要素を全て取得する
    var matches = document.querySelectorAll('.entry-content h1, .entry-content h2');

    // 取得した見出しタグ要素の数だけ以下の操作を繰り返す
    matches.forEach(function (value, i) {
        // 見出しタグ要素のidを取得し空の場合は内容をidにする
        var id = value.id;
        if(id === '') {
            id = value.textContent;
            value.id = id;
        }

        // 要素がh2タグの場合
        if(value.tagName === 'H1') {
            var ul = document.createElement('ul');
            var li = document.createElement('li');
            var a = document.createElement('a');

            // 追加する<ul><li><a>タイトル</a></li></ul>を準備する
            a.innerHTML = value.textContent;
            a.href = '#' + value.id;
            li.appendChild(a)
            ul.appendChild(li);

            // コンテナ要素である<div>の中に要素を追加する
            div.appendChild(ul);
        }

        // 要素がh3タグの場合
        if(value.tagName === 'H2') {
            var ul = document.createElement('ul');
            var li = document.createElement('li');
            var a = document.createElement('a');

            // コンテナ要素である<div>の中から最後の<li>を取得する。
            var lastUl = div.lastElementChild;
            var lastLi = lastUl.lastElementChild;

            // 追加する<ul><li><a>タイトル</a></li></ul>を準備する
            a.innerHTML = value.textContent;
            a.href = '#' + value.id;
            li.appendChild(a)
            ul.appendChild(li);

            // 最後の<li>の中に要素を追加する
            lastLi.appendChild(ul);
        }
    });

    // 最後に画面にレンダリング
    contentsList.appendChild(div);
});

$(function () {
    var headerHight = 190; //ヘッダの高さ
    $('a[href^=#]').click(function(){
        var href= $(this).attr("href");
          var target = $(href == "#" || href == "" ? 'html' : href);
           var position = target.offset().top-headerHight; //ヘッダの高さ分位置をずらす
        $("html, body").animate({scrollTop:position}, 550, "swing");　//この数値は移動スピード
           return false;
    });
});