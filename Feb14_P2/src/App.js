import logo from './logo.svg';
import './App.css';
import First from './components/first/first';
import Second from './components/second/second';
import Third from './components/third/third';
import ButtonEx from './components/buttonex/buttonex';
import Name from './components/name/name';
import NameEx from './components/nameex/nameex';
import Login from './components/login/login';
import UserShow from './components/usershow/usershow';
import EmployShow from './components/employshow/employshow';


function App() {
  return (
    <div className="App">
      <p>From Wipro Batch 2025</p>
        <First /> <br/>
        <Second /> <br/>
        <Third firstName="Prasanna" lastName="Pappu" /> <br/>
        <ButtonEx /> <br/>
        <Name /> <br/>
        <NameEx /> <br/>
        <Login /> <hr/>
        <UserShow /> <hr/>
        <EmployShow />
    </div>
  );
}

export default App;
