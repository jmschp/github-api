import fetchWithAuth from "../utils/fetch_with_auth";

export default function fetch_git_hub_api_username() {
  const btnSubmit = document.getElementById("submit-username");
  const inputUsername = document.getElementById("username");
  if (btnSubmit) {
    btnSubmit.addEventListener("click", async () => {
      if (inputUsername.value) {
        const response = await fetch(`https://api.github.com/users/${inputUsername.value}`, {
          accept: "application/vnd.github.v3+json",
        }).then((response) => response.json())
          .then((data) => {
            console.log({username: data });

            fetchWithAuth("/git_hub_users", {
              headers: {
                'Content-Type': 'application/json'
              },
              method: "post",
              body: JSON.stringify({username: data })
            })});
          console.log(response);
      } else {
        alert("Please add a user name");
      }
    });
  }
}

// export default fetch_git_hub_api_username;
