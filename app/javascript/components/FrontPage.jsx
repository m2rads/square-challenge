import React from "react";

const FrontPage = () => {
  const handleLinkClick = () => {
    window.location.href = "/square/link_account"; // Replace with your Rails route for OAuth process
  };

  return (
    <div>
      <h1>Welcome to the Front Page</h1>
      <button onClick={handleLinkClick}>Link Square Account</button>
    </div>
  );
};

export default FrontPage;
