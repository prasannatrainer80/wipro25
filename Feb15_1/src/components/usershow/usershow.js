import React, {Component} from 'react';
import axios from 'axios';
import Menu from '../menu/menu';

export default class UserShow extends Component {
   
  constructor(props) {
    super(props);
    this.state = {
      users : [],
      // cid : localStorage.getItem("custId")
    };
}
componentDidMount() {
  // alert(localStorage.getItem("custId"));
  axios.get("https://jsonplaceholder.typicode.com/users")
  .then(response => {
    this.setState({
      users : response.data 
    })
    console.log(response.data)
  })
}
render() {
  
  const {users} = this.state
   return <div className="component-post-service">
    <Menu />
    <table border="3" align='center'>
      <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Username</th>
        <th>Email</th>
        <th>Mobile</th>
        <th>website</th>
      </tr>
      {
        users.map( u => 
          <tr>
            <td>{u.id}</td>
            <td>{u.name}</td>
            <td>{u.username}</td>
            <td>{u.email}</td>
            <td>{u.phone}</td>
            <td>{u.website}</td>
            
            {/* <td>{employ.dept}</td>
            <td>{employ.desig}</td>
            <td>{employ.basic}</td> */}
          </tr>
      )
      }
    </table>
    </div>;
}

    
  }
