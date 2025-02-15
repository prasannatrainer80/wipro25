import React, {Component} from 'react';
import Menu from '../menu/menu';
// import './name.scss'
// import { connect } from "react-redux";
// import { bindActionCreators } from "redux";
// import * as nameActions from "../../store/name/actions";
export default class Name extends Component {
    constructor(props) {
        super(props);
        this.state = {
          firstName : 'Raj',
          lastName : 'Kishore'
        };
    }
    render() {
      return <div className="component-name">
        <Menu /> <br/>
          First Name : <b>{this.state.firstName}</b> 
          Last Name : <b>{this.state.lastName}</b>  
        </div>;
    }
  }
// export default connect(
//     ({ name }) => ({ ...name }),
//     dispatch => bindActionCreators({ ...nameActions }, dispatch)
//   )( name );