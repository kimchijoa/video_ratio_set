// 해당 파일들은 유틸성을 가진 함수들만 따로 뭉쳐둠
// 함수에 export를 앞에 붙여야 외부에서 사용가능..한듯..?

export function create_cookie(cookie_name, value, days) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + days);
    // 설정 일수만큼 현재시간에 만료값으로 지정
    
    var cookie_value = escape(value) + ((days == null) ? '' : '; expires=' + exdate.toUTCString());
    document.cookie = cookie_name + '=' + cookie_value;
}