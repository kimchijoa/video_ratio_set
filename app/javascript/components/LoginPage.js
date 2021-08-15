import React from "react"
import PropTypes from "prop-types"
import axios from 'axios'

class LoginPage extends React.Component {
  constrctor(){
    //super();
    this.state = { user_email: "", user_pw: "" };
    
  }

  myChangHandler01 = evt => {
    this.setState({ user_email: evt.target.value });
  }

  myChangHandler02 = evt => {
    this.setState({ user_pw: evt.target.value });
  }

  doSave = () => {
    const { userid } = this.state;
    const { userpw } = this.state;
    alert(userid);
  }

  SearchApi = evt => {
    const url = "https://kkhapi.herokuapp.com/logins";
    axios.get(url)
    .then(function(response) {
        console.log(response.data);
        alert("성공");
    })
    .catch(function(error) {
        console.log("실패");
    })   
  }

  
  RegisterApi = evt => {
    const url = "https://kkhapi.herokuapp.com/logins/user_create";
    axios.post(url, {email: this.state.user_email, password: this.state.user_pw})
    .then(function(response) {
        console.log(response.data);
        alert("성공");
    })
    .catch(function(error) {
        console.log(error.response.status);
        if (error.response.status == 422)
          alert("이미 존재하는 EMAIL 입니다.");
    })   
  }

  render () {
    return (
      <div className="login_wrap">
        <h2>회원가입 페이지</h2>

        
        <div className="form-group">
          <label>이메일 주소</label>
          <input type="email" className="form-control" name="email" onChange={this.myChangHandler01} placeholder="이메일을 입력하세요" />
        </div>
        <div className="form-group">
          <label>암호</label>
          <input type="password" className="form-control" name="password" onChange={this.myChangHandler02} placeholder="암호" />
        </div>

        <button className="btn btn-primary large" onClick={this.RegisterApi}>회원가입</button>

        <a className="btn btn-default" onClick={this.SearchApi}>모두 검색</a>
      </div>
    );
  }
}

export default LoginPage


// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

