import React, {Component} from 'react';

export default class First extends Component {
    // constructor(props) {
    //     super(props);
    //     this.state = {};
    // }
    render() {
      return <div className="component-first">
        Welcome to My First Component...
        </div>;
    }
  }
// export default connect(
//     ({ first }) => ({ ...first }),
//     dispatch => bindActionCreators({ ...firstActions }, dispatch)
//   )( first );