import fetchWithAuth from "../utils/fetch_with_auth";

export default function fetch_git_hub_api_username() {
  const btnSubmit = document.getElementById("submit-username");
  const inputUsername = document.getElementById("username");
  if (btnSubmit) {
    btnSubmit.addEventListener("click", async () => {
      if (inputUsername.value) {
        await fetch(`https://api.github.com/users/${inputUsername.value}`, {
          accept: "application/vnd.github.v3+json",
        }).then((response) => response.json())
          .then((data) => {
            fetchWithAuth("/git_hub_users", {
              headers: { "Content-Type": "application/json" },
              method: "post",
              body: JSON.stringify({ username: data }),
            }).then((response) => {
              if (response.ok) {
                Turbolinks.visit(window.location.href, { action: "replace" })
              } else {
                return response.json()
              }
            })
              .then(data => {
                let alertMessage = ""
                for (const attribute in data) {
                  alertMessage += `${alertMessage} ${attribute} ${data[attribute]}\n`
                }
                console.log(data);
                alert(alertMessage);
              })
              .catch(error => console.error(error));
          });
      } else {
        alert("Please add a user name");
      }
    });
  }
} 
