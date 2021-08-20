// 해당 파일들은 유틸성을 가진 함수들만 따로 뭉쳐둠
// 함수에 export를 앞에 붙여야 외부에서 사용가능..한듯..?

//쿠키 생성
export function create_cookie(cookie_name, value, days) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + days);
    // 설정 일수만큼 현재시간에 만료값으로 지정
    
    var cookie_value = escape(value) + ((days == null) ? '' : 'path=/; expires=' + exdate.toUTCString());
    document.cookie = cookie_name + '=' + cookie_value;
    
}

//로딩화면 띄우기
export function LoadingWithMask() {
    //화면의 높이와 너비를 구합니다.
    var maskHeight = $(document).height();
    var maskWidth  = window.document.body.clientWidth;
     
    //화면에 출력할 마스크를 설정해줍니다.
    var mask       = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
    var loadingImg = '';
      
    loadingImg += "<div id='loadingImg'>";
    loadingImg += " <img src='/Spinner.gif' style='position: relative; display: block; margin: 0px auto;'/>";
    loadingImg += "</div>";  
  
    //화면에 레이어 추가
    $('body')
        .append(mask)
        .append(loadingImg)
        
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
    $('#mask').css({
            'width' : maskWidth
            , 'height': maskHeight
            , 'opacity' : '0.3'
    }); 
  
    //마스크 표시
    $('#mask').show();   
  
    //로딩중 이미지 표시
    $('#loadingImg').show();
}

//로딩화면 사라지게하기
//===================================================
export function closeLoadingWithMask() {
    // function closeLoadingWithMask() {
        $('#mask, #loadingImg').hide();
        $('#mask, #loadingImg').remove(); 
        location.reload();
        //메인페이지로 이동하는 기능 +
}