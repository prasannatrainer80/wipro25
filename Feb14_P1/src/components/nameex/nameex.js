import React, {Component} from 'react';
// import './nameex.scss'
// import { connect } from "react-redux";
// import { bindActionCreators } from "redux";
// import * as nameexActions from "../../store/nameex/actions";
export default class NameEx extends Component {
    constructor(props) {
        super(props);
        this.state = {
          firstName : '',
          lastName : '',
          fullName : ''
        };
    }

    changeFirstName(event) {
      this.setState({
        firstName : event.target.value
      })
    }

    changeLastName(event) {
      this.setState({
        lastName : event.target.value
      })
    }

    show = () => {
      this.setState({
        fullName : this.state.firstName + " " +this.state.lastName
      })
    }

    render() {
      return <div className="component-nameex">
          <form>
            <label>First Name :</label>
            <input type="text" name='firstName' 
              onChange={this.changeFirstName.bind(this)}
            value={this.state.firstName} />
            <br/> 
            <label>Last Name</label>
            <input type="text" name="lastName" 
              onChange={this.changeLastName.bind(this)}
            value={this.state.lastName} />
            <br/> 
            <label>Full Name</label>
            <input type="text" name="fullName" 
              value={this.state.fullName} /> <br/>
            <input type="button" value="Show" onClick={this.show} />
          </form>
        </div>;
    }
  }
// export default connect(
//     ({ nameex }) => ({ ...nameex }),
//     dispatch => bindActionCreators({ ...nameexActions }, dispatch)
//   )( nameex );