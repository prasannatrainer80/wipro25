import UseFetchUrl from "./UseFetchUrl";

const UserShow = () => {

    const [data] = UseFetchUrl("https://jsonplaceholder.typicode.com/users")
    return(
        <div>
            {data.map((user) => 
                <tr>
                    <td>{user.id}</td>
                    <td>{user.name}</td>
                    <td>{user.username}</td>
                    <td>{user.email}</td>
                    <td>{user.phone}</td>
                </tr>
            )}

        </div>
    )
}

export default UserShow;