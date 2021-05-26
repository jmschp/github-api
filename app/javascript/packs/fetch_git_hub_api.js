import fetchWithAuth from "../utils/fetch_with_auth";

export default function fetch_git_hub_api_username() {
  const btnSubmit = document.getElementById("submit-username");
  const inputUsername = document.getElementById("username");
  if (btnSubmit) {
    btnSubmit.addEventListener("click", async () => {
      if (inputUsername.value) {
        await fetch(`https://api.github.com/users/${inputUsername.value}`, {
          accept: "application/vnd.github.v3+json",
        })
          .then((response) => {
            if (response.ok) {
              return response.json();
            } else {
              alert("Please verify the user name");
              throw new Error(`Response ${response.status}`);
            }
          })
          .then((data) => {
            fetchWithAuth("/git_hub_users", {
              headers: { "Content-Type": "application/json" },
              method: "post",
              body: JSON.stringify({ username: data }),
            })
              .then((response) => {
                if (response.ok) {
                  Turbolinks.visit(window.location.href, { action: "replace" });
                } else {
                  throw new Error(response.json());
                }
              })
              .catch((error) => {
                // console.log("data", data);
                // let alertMessage = [];
                // for (const attribute in data) {
                //   alertMessage.push(`${alertMessage} ${attribute} ${data[attribute]}`);
                // }
                console.error(error);
                alert("It was not possible to save that user");
              });
          })
          .catch((error) => console.error(error));
      } else {
        alert("Please add a user name");
      }
    });
  }
}
