export default auth = (email, password) =>
  axios.post("http://localhost:3000/users/sign_in", {
    user: {
      email: email,
      password: password,
      remember_me: 0,
    },
  });
