import React, {Component} from 'react';
// import './buttonex.scss'
// import { connect } from "react-redux";
// import { bindActionCreators } from "redux";
// import * as buttonexActions from "../../store/buttonex/actions";
export default class ButtonEx extends Component {
    show = () => {
      alert("Welcome to React...");
    }  

    company = () => {
      alert("Company is Wipro...");
    }

  constructor(props) {
        super(props);
        this.state = {};
    }
    
    render() {
      return <div className="component-buttonex">
          <input type="button" value="Show" onClick={this.show} /> 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="button" value="company" onClick={this.company} />
        </div>;
    }
  }
// export default connect(
//     ({ buttonex }) => ({ ...buttonex }),
//     dispatch => bindActionCreators({ ...buttonexActions }, dispatch)
//   )( buttonex );