import { getStaticProps } from "next";
export default function Page1({data}) {
    return(
        <div>
            <table border="3">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>City</th>
                </tr>
                {/* {data.map(x => {
                    {x.id}
                })} */}
                </thead>
            </table>
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
    alert(data);
    return {
        props : {data},
    }
}