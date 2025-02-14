import React, {Component} from 'react';
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
        From Third Component...
        <br/>
        First Name : <b> {this.props.firstName}</b> <br/>
        Last Name : <b>{this.props.lastName}</b>
        </div>;
    }
  }
// export default connect(
//     ({ third }) => ({ ...third }),
//     dispatch => bindActionCreators({ ...thirdActions }, dispatch)
//   )( third );