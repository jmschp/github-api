export default function selectUser() {
  const userToCompare = [];
  const compareBtns = document.querySelectorAll("[data-compare]");
  if (compareBtns) {
    compareBtns.forEach((btn) => {
      btn.addEventListener("click", () => {
        if (userToCompare.length > 0) {
          if (userToCompare.includes(btn.dataset.compare)) {
            userToCompare.splice(userToCompare.indexOf(btn.dataset.compare), 1);
            btn.classList.toggle("compare-active");
          } else {
            userToCompare.push(btn.dataset.compare);
            Turbolinks.visit(`${window.location.origin}/compare_users/${userToCompare[0]}/${userToCompare[1]}`, {
              action: "advance",
            });
          }
        } else {
          btn.classList.toggle("compare-active");
          userToCompare.push(btn.dataset.compare);
        }
      });
    });
  }
}
