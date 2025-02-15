import axios from 'axios';
import React, {Component} from 'react';
import Menu from '../menu/menu';
// import './empinsert.scss'
// import { connect } from "react-redux";
// import { bindActionCreators } from "redux";
// import * as empinsertActions from "../../store/empinsert/actions";
export default class EmpInsert extends Component {
    
  constructor(props) {
        super(props);
        this.state = {
          empno : 0,
          name : '',
          basic : 0
        };
  }

  addEmploy = () => {
    // alert(this.state.empno + " " +this.state.name + " " +
    //   this.state.basic
    // )
    axios.post("http://localhost:1113/addemploy",{
      empno : this.state.empno,
      name : this.state.name,
      basic : this.state.basic 
    }).then(resp => {
      alert(resp.data);
      console.log(resp.data);
    })
  }

  handleInputChange = ({target : {name, value}}) => {
    this.setState({ [name] : value});
  }

    render() {
   
      return  <div className="component-empinsert">
           <Menu />
                    <table border="3" align="center">
            <tr>
              <th colspan="2">Add Employ</th>
            </tr>
            <tr>
              <th>Employ No</th>
              <td>
                <input type="number" name="empno" value={this.state.empno} 
                    onChange={this.handleInputChange}
                />
              </td>
            </tr>
            <tr>
              <th>Employ Name</th>
              <td>
                <input type="text" name="name" value={this.state.name}
                  onChange={this.handleInputChange} />
              </td>
            </tr>
            <tr>
              <th>Basic</th>
              <td>
                <input type="number" name="basic" value={this.state.basic}
                  onChange={this.handleInputChange} />
              </td>
            </tr>
            <tr>
              <th colspan="2">
                <input type="button" value="Add Employ"
                  onClick={this.addEmploy} />
              </th>
            </tr>
          </table>
        </div>;
    }
  }
// export default connect(
//     ({ empinsert }) => ({ ...empinsert }),
//     dispatch => bindActionCreators({ ...empinsertActions }, dispatch)
//   )( empinsert );