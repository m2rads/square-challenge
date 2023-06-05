import React from "react";

const FrontPage = () => {
  const handleLogin = async () => {
    try {
      const response = await fetch("/auth/developer");
      const { user_info } = await response.json();
      console.log(user_info); // Do something with the user info
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <button type="button" onClick={handleLogin}>
      Login with Developer
    </button>
  );
};

export default FrontPage;
