import { createContext } from "react"

export const userData = {
    userName : "Prasanna",
    company : "Wipro",
    topic : "Dotnet React Training"
}

export const UserContext = createContext(userData)