import React, {Component} from 'react';
import Menu from '../menu/menu';
// import './third.scss'
// import { connect } from "react-redux";
// import { bindActionCreators } from "redux";
// import * as thirdActions from "../../store/third/actions";
export default class Third extends Component {
    // constructor(props) {
    //     super(props);
    //     this.state = {};
    // }
    render() {
      return <div className="component-third"> 
        <Menu />
        From Third Component...
        <br/><br/>
        First Name : <b> {this.props.firstName}</b> <br/>
        Last Name : <b>{this.props.lastName}</b>
        </div>;
    }
  }
// export default connect(
//     ({ third }) => ({ ...third }),
//     dispatch => bindActionCreators({ ...thirdActions }, dispatch)
//   )( third );