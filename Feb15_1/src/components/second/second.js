import React, {Component} from 'react';
import Menu from '../menu/menu';
// import './second.scss'
// import { connect } from "react-redux";
// import { bindActionCreators } from "redux";
// import * as secondActions from "../../store/second/actions";
export default class Second extends Component {
    // constructor(props) {
    //     super(props);
    //     this.state = {};
    // }
    render() {
      return <div className="component-second">
        <Menu /> <br/>
          This is Second Component...Wipro Batch
        </div>;
    }
  }
// export default connect(
//     ({ second }) => ({ ...second }),
//     dispatch => bindActionCreators({ ...secondActions }, dispatch)
//   )( second );