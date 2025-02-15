import React, {Component} from 'react';
import axios from 'axios';
import Menu from '../menu/menu';

export default class EmployShow extends Component {
    constructor(props) {
        super(props);
        this.state = {
          employs : []
        };
    }

    componentDidMount() {
       // alert(localStorage.getItem("custId"));
  axios.get("http://localhost:1113/showEmploy")
  .then(response => {
    this.setState({
      employs : response.data 
    })
    console.log(response.data)
  })
    }
    render() {

      const {employs} = this.state
       return <div className="component-post-service">
              <Menu />
        <table border="3" align='center'>
          <tr>
            <th>Employ Id</th>
            <th>Name</th>
            <th>Basic</th>
          </tr>
          {
            employs.map( u => 
              <tr>
                <td>{u.empno}</td>
                <td>{u.name}</td>
                <td>{u.basic}</td>        
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
// export default connect(
//     ({ employshow }) => ({ ...employshow }),
//     dispatch => bindActionCreators({ ...employshowActions }, dispatch)
//   )( employshow );