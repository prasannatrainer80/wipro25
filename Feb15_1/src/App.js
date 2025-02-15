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
import EmploySearch from './components/employsearch/employsearch';

// import EmploySearchNew from './components/employsearchNew/employsearchNew';
import EmpSearch from './components/empsearch/empsearch';
import EmpInsert from './components/empinsert/empinsert';
import { BrowserRouter, Route, Routes, Link } from 'react-router-dom';
import Menu from './components/menu/menu';

function App() {
  return (
    <div className="App">
      <p>From Wipro Batch 2025</p>
        <BrowserRouter>
          <Routes>
            <Route path='/' element={<Menu />} />
            <Route path="/first" element={<First />} />
            <Route path="/second" element={<Second />} /> 
            <Route path="/third" element={<Third firstName="Aditya" lastName="Vangaru" />} />
            <Route path="/buttonex" element={<ButtonEx />} /> 
            <Route path="/name" element={<Name />} />
            <Route path="/nameex" element={<NameEx />}/> 
            <Route path="/userShow" element={<UserShow />} />
            <Route path="/userSearch" element={<EmploySearch />} /> 
            <Route path="/employShow" element={<EmployShow />} /> 
            <Route path="/empSearch" element={<EmpSearch />} /> 
            <Route path="/addEmploy" element={<EmpInsert />} />
            {/* <Route path="" */}
          </Routes>
        </BrowserRouter>
        {/* <First /> <br/>
        <Second /> <br/>
        <Third firstName="Prasanna" lastName="Pappu" /> <br/>
        <ButtonEx /> <br/>
        <Name /> <br/>
        <NameEx /> <br/>
        <Login /> <hr/>
        <UserShow /> <hr/>
        <EmployShow /> <hr/>
        <EmploySearch /> <hr/>
        <EmpSearch /> <hr/>
        <EmpInsert /> */}
      
        {/* <EmploySearchNew /> */}
    </div>
  );
}

export default App;
