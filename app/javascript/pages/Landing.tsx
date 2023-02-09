import * as React from 'react';

import useAuth from '../hooks/useAuth';

export default function Landing() {
  const { onLogin } = useAuth();

  return (
    <div>
      <p>Hello! You are not logged in</p>

      <form onSubmit={onLogin}>
        <div>
          <input name="email" type="text" placeholder="Email" />
        </div>
        <div>
          <input name="password" type="password" placeholder="Password" />
        </div>
        <div>
          <button type="submit">Sign in</button>
        </div>
      </form>

      <button type='button' onClick={onLogin}>Click me to log in</button>
    </div>
  )
}
