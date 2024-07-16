import { useState } from 'react'
import Project from './component/Project'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <Project />
    </>
  )
}

export default App
