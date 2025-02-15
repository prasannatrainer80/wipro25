import React, {Component} from 'react';
import { Link } from 'react-router-dom';
export default class Menu extends Component {
    constructor(props) {
        super(props);
        this.state = {};
    }
    render() {
      return <div className="component-menu">
        Welcome to Menu Page <hr/>
        <Link to="/first">First</Link> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <Link to="/second">Second</Link>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <Link to="/third">Third</Link>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <Link to="/name">Name</Link>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <Link to="/nameex">Name Example</Link>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <Link to="/userShow">User Show</Link>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <Link to='/userSearch'>User Search</Link>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <Link to="/employShow">Employ Show</Link>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <Link to="/empSearch">Employ Search</Link>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <Link to="/addEmploy">Add Employ</Link>        
      </div>;
    }
  }
// export default connect(
//     ({ menu }) => ({ ...menu }),
//     dispatch => bindActionCreators({ ...menuActions }, dispatch)
//   )( menu );