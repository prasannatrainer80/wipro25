import React, {Component} from 'react';
// import './login.scss'
// import { connect } from "react-redux";
// import { bindActionCreators } from "redux";
// import * as loginActions from "../../store/login/actions";
export default class Login extends Component {
    constructor(props) {
        super(props);
        this.state = {
          userName : '',
          passWord : ''
        };
    }

    login = () => {
      if (this.state.userName == "wipro" && 
          this.state.passWord=="wipro") {
            alert("Correct");
          } else {
            alert("Invalid");
          }
    }

    changePassword(event) {
      this.setState({
        passWord : event.target.value
      })
    }
    
    changeUserName(event)  {
      this.setState({
        userName : event.target.value 
      })
    }

    render() {
      return <div className="component-login">
          <form>
            <label>User Name : </label>
            <input type="text" name='userName' 
              value={this.state.userName} 
              onChange={this.changeUserName.bind(this)}
              /> <br/> 
            <label>Password</label>
            <input type="password" name='passWord' 
              value={this.state.passWord} 
              onChange={this.changePassword.bind(this)}
              /> <br/>
            <input type="button" value="Login" onClick={this.login.bind(this)} />
          </form>
        </div>;
    }
  }
// export default connect(
//     ({ login }) => ({ ...login }),
//     dispatch => bindActionCreators({ ...loginActions }, dispatch)
//   )( login );