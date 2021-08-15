import React from "react"
import PropTypes from "prop-types"
import axios from 'axios'
import * as CommonUtils from './CommonUtils.js';

class LoginPage02 extends React.Component {
  constrctor(){
    //super();
    this.state = { user_email_login: "", user_pw_login: "" };
    
  }

  UserEmailInput = evt => {
    this.setState({ user_email_login: evt.target.value });
  }

  UserPwInput = evt => {
    this.setState({ user_pw_login: evt.target.value });
  }
  
  LoginApi = evt => {
    const url = "https://kkhapi.herokuapp.com/logins/user_login";
    axios.post(url, {email: this.state.user_email_login, password: this.state.user_pw_login})
    .then(function(response) {
        // console.log(response.data);
        var token = response.data;
        // sessionStorage.setItem("jwt_token",token);
        CommonUtils.create_cookie('access_token',token,1);
        alert("로그인 성공");
    })
    .catch(function(error) {
        console.log(error.response.status);
        if (error.response.status == 400)
          alert("아이디, PW를 다시 확인해주세요.");
    })   
  }

  render () {
    return (
      <div className="login_wrap">
          <h2>로그인 테스트</h2>

          <div className="form-group">
          <label>이메일 주소</label>
          <input type="email" className="form-control" name="email" onChange={this.UserEmailInput} placeholder="이메일을 입력하세요" />
        </div>
        <div className="form-group">
          <label>암호</label>
          <input type="password" className="form-control" name="password" onChange={this.UserPwInput} placeholder="암호" />
        </div>

        <button className="btn btn-success large" onClick={this.LoginApi}>로그인</button>

      </div>
        
    );
  }
}

export default LoginPage02
