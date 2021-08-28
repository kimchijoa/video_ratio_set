import React from "react"
import PropTypes, { string } from "prop-types"
import axios from 'axios'
import * as CommonUtils from './CommonUtils.js';

class ConvertRatio extends React.Component {
  constrctor(){
    //super();
    this.state = { video_id: "" };
    
  }
  
  VideoConvert = evt => {
    //로딩창 생성
    console.log("로딩 테스트...");
    CommonUtils.LoadingWithMask();
    const v_id = window.location.pathname.split("/");
    //var v_id = 11;
    this.setState({video_id:v_id.slice(-1)[0]});
    console.log(v_id.slice(-1)[0]); 
    const url = "http://localhost:3000/first/start_ratio?id=" + {video_id};
    //const url = "http://localhost:3000";
    // const url = "http://localhost:3000/first/start_ratio"
    //axios.get(url, {id: this.state.video_id})
    axios.get(url, {id: video_id})
    .then(function(response) {
        //나중에 활용이 가능한가? 알아보기
        // console.log(response.data);
        // var token = response.data;
        // sessionStorage.setItem("jwt_token",token);
        // CommonUtils.create_cookie('access_token',token,1);
        CommonUtils.closeLoadingWithMask();
        //const d_link="http://localhost:3000/";
        alert("영상변환 완료!");
        const d_link = document.getElementById("d_link");
        d_link.style.display = "block";
    })
    .catch(function(error) {
        //console.log(error.response.status);
        if (error.response.status == 400)
          alert("아이디, PW를 다시 확인해주세요.");
          CommonUtils.closeLoadingWithMask();
    })
  }

  render () {
    return (
      <div className="login_wrap">
          <h2>React VideoRatio 테스트</h2>
          <div id="v_id">11</div>
        <button className="btn btn-success large" onClick={this.VideoConvert}>영상변환</button>

      </div>
        
    );

  }
}

export default ConvertRatio
