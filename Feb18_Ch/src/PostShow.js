import UseFetchUrl from "./UseFetchUrl";

const PostShow = () => {
    const [data] = UseFetchUrl("https://jsonplaceholder.typicode.com/posts")
    return(
        <div>
            {data.map((user) => 
                <tr>
                    <td>{user.id}</td>
                    <td>{user.userId}</td>
                    <td>{user.title}</td>
                    <td>{user.body}</td>
                   
                </tr>
            )}

        </div>
    )

}

export default PostShow;