import React, {Component} from 'react';
import axios from 'axios';
import Menu from '../menu/menu';
export default class EmpSearch extends Component {
  constructor(props) {
    super(props);
    this.state = {
      empno:0,
      employ : {}
      // passWord : ''
    };
}

searchEmp = () => {
  const {employ} = this.state
  axios.get("http://localhost:1113/searchEmploy/" + this.state.empno)
  .then(response => {
    this.setState({
      employ : response.data
    })
    console.log(employ)
  })

}

changeEmpno(event) {
  this.setState({
    empno : event.target.value
  })
}



render() {
  const {employ} = this.state;
  return <div className="component-login">
    <Menu />
      <form>
        <label>Employ Id : </label>
        <input type="number" name='empno' 
          value={this.state.empno} 
          onChange={this.changeEmpno.bind(this)}
          /> <br/> 
        <input type="button" value="Search" onClick={this.searchEmp.bind(this)} />
      </form>
      Id : <b>{employ.empno}</b> <br/>
      Name : <b>{employ.name}</b><br/>
      Salary : <b>{employ.basic}</b> <br/>
   
    </div>;
}
}