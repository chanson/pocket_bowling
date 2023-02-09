import * as React from 'react';
import {
  useNavigate,
  useLocation,
} from 'react-router-dom';

import auth from '../lib/auth';
import { AuthContext } from "../contexts/AuthContext";

interface AuthProviderProps {
  children: React.ReactNode
}


const AuthProvider = ({ children }: AuthProviderProps ) => {
  const navigate = useNavigate();
  const location = useLocation();

  const [token, setToken] = React.useState(null);

  const handleLogin = async (e: React.SyntheticEvent) => {
    e.preventDefault();
    console.log("submit");

    const target = e.target as typeof e.target & {
      email: { value: string };
      password: { value: string };
    };

    try {
      const { data } = await auth(target.email.value, target.password.value);
      window.alert(data);
    } catch(err) {
      window.alert('Error signing in');
    }

    setToken(token);

    const origin = location.state?.from?.pathname || '/dashboard';
    navigate(origin);
  };

  const handleLogout = () => {
    setToken(null);
  };

  const value = {
    token,
    onLogin: handleLogin,
    onLogout: handleLogout,
  };

  return (
    <AuthContext.Provider value={value}>
      {children}
    </AuthContext.Provider>
  );
};

export default AuthProvider;
