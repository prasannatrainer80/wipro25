import React, {Component} from 'react';
import axios from 'axios';
import Menu from '../menu/menu';
// import './employsearch.scss'
// import { connect } from "react-redux";
// import { bindActionCreators } from "redux";
// import * as employsearchActions from "../../store/employsearch/actions";
export default class EmploySearch extends Component {
  constructor(props) {
    super(props);
    this.state = {
      id:0,
      user : {}
      // passWord : ''
    };
}

searchUser = () => {
  const {user} = this.state
  axios.get("https://jsonplaceholder.typicode.com/users/" + this.state.id)
  .then(response => {
    this.setState({
      user : response.data
    })
    console.log(user)
  })

}

changeId(event) {
  this.setState({
    id : event.target.value
  })
}



render() {

  const {user} = this.state;
  return <div className="component-login">
      <Menu />
      <form>
        <label>User Id : </label>
        <input type="number" name='id' 
          value={this.state.id} 
          onChange={this.changeId.bind(this)}
          /> <br/> 
        <input type="button" value="Search" onClick={this.searchUser.bind(this)} />
      </form>
      Id : <b>{user.id}</b> <br/>
      Name : <b>{user.name}</b><br/>
      Email : <b>{user.email}</b> <br/>
      UserName : <b>{user.email}</b><br/> 
      Phone : <b>{user.phone}</b> <br/>
      Website : <b>{user.website}</b>
    </div>;
}
}