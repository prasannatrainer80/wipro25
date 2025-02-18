import { useState, useEffect, useRef } from "react";

const RefEx3 = () => {

  const [inputValue, setInputValue] = useState("");
  const count = useRef(0);

  useEffect(() => {
    count.current = count.current + 1;
  });

  return (
    <>
      <input
        type="text"
        value={inputValue}
        onChange={(e) => setInputValue(e.target.value)}
      />
      <h1>Render Count as How many Times you changed TextBox
        : {count.current}</h1>
    </>
  );
}
export default RefEx3;