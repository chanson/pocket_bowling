import * as React from 'react';
import { NavLink } from 'react-router-dom';

import useAuth from '../hooks/useAuth';

export default function Navigation() {
  const { token, onLogout } = useAuth();

  return (
    <nav>
      <NavLink to="/landing">Landing</NavLink>
      <NavLink to="/dashboard">Dashboard</NavLink>
      <NavLink to="/admin">Admin</NavLink>

      {token && (
        <button type="button" onClick={onLogout}>
          Sign Out
        </button>
      )}
    </nav>
  );
};

