import * as React from "react";
import * as ReactDOM from "react-dom";
import { createRoot } from 'react-dom/client';

import {
  BrowserRouter as Router,
  Routes,
  // Switch,
  Route,
  // Link,
  // Redirect,
  // useHistory,
  useLocation
} from "react-router-dom";

import axios from "../lib/axios";

import Navigation from "./Navigation";
import Landing from "../pages/Landing";
import Dashboard from "../pages/Dashboard";
import PageMissing from "../pages/PageMissing";
import AuthProvider from "../providers/AuthProvider";
import PrivateRoute from "../lib/PrivateRoute";

interface AppProps {
  arg: string;
}

const Admin = () => {
  return (
    <>
      <h2>Admin (Protected)</h2>
    </>
  );
};

const App = ({ arg }: AppProps) => {
  let location = useLocation();

  React.useEffect(() => {
    axios.get("http://localhost:3000/session");
  }, [location]);

  return (
    <AuthProvider>
      <Navigation />

      <div className='text-3xl text-slate-400'>{`Hello, ${arg}!`}</div>

      <Routes>
        <Route index element={<Landing />} />
        <Route path="landing" element={<Landing />} />
        <Route
          path="dashboard"
          element={
            <PrivateRoute>
              <Dashboard />
            </PrivateRoute>
          }
        />
        <Route
          path="admin"
          element={
            <PrivateRoute>
              <Admin />
            </PrivateRoute>
          }
        />

        <Route path="*" element={<PageMissing />} />
      </Routes>
    </AuthProvider>
  );
};


document.addEventListener("DOMContentLoaded", () => {
  const container = document.getElementById('root');
  const root = createRoot(container!);
  root.render(
    <Router>
      <App arg="Rails 7 with ESBuild" />
    </Router>
  );
});
