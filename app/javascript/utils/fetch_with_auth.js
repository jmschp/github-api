import { csrfToken } from "@rails/ujs";

export default function fetchWithAuth(url, options = {}) {
  options.headers = {
    "X-CSRF-Token": csrfToken(),
    ...options.headers,
  };
  options.credentials = "same-origin";
  // console.log(url, options.headers);
  return fetch(url, options);
}
