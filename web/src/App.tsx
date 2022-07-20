import { useBooksQuery, useCreateBookMutation } from "./graphql/generated";
import { useState } from "react"
import { setSyntheticTrailingComments } from "typescript";
function App() {
  const { data: { books = [] } = {} } = useBooksQuery();
  const [createBook] = useCreateBookMutation({refetchQueries: ["Books"]});
  const [title, setTitle] =  useState("")
  return (
    <div>
      <input value={title} onChange={(e) => setTitle(e.target.value) } />
      <button onClick={() => {
        createBook({variables: {params: {title: title}}});
        setTitle(""); // 初期化
      }}>
        保存
      </button>
      {books.map((book) => (
        <div key={book.id}>{book.title}</div>
      ))}
    </div>
  );
}

export default App;
