import * as React from 'react';

import useAuth from '../hooks/useAuth';

export default function Dashboard() {
  const { token } = useAuth();

  return (
    <>
      <p>Hello! You are logged in</p>

      <div>Authenticated as {token}</div>
    </>
  )
}
