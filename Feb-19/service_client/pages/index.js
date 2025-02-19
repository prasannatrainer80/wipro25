export default function Users( {data} ){
  return (
      <div>
          <h1>List of Employees with CSR (Client-Side Rendering)</h1>
          <ul>
              {data.map((user,index)=>{
               return <li key={index}>Id : {user.id} , 
                   Name : {user.name} , Age : {user.age}, City : {user.city}
               </li>   
              })}
          </ul>
      </div>
  )
}

export async function getStaticProps() {
  
  const data = [ 
    { id: 1, name: 'Rahul Sharma', age: 28, city: 'Mumbai' },
    { id: 2, name: 'Priya Singh', age: 34, city: 'Delhi' },
    { id: 3, name: 'Amit Kumar', age: 45, city: 'Bangalore' },
    { id: 4, name: 'Sneha Roy', age: 22, city: 'Kolkata' },
];
return {
    props : {data},
}
}