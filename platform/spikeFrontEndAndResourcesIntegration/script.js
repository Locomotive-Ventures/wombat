// This code is for API demonstation purposes only

// send record to DB
function sendToApiGateway(campaignId, phone) {
  const apiUrl =
    "https://d1uud242rb.execute-api.ap-southeast-2.amazonaws.com/Prod/message"; // Replace with the actual API URL (current endpoint is deployed to Olgas account)
  const data = {
    uniqueId:
      "id" + Date.now().toString(36) + Math.random().toString(36).substr(2, 9),
    campaignId: campaignId,
    phone: phone,
  };

  fetch(apiUrl, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  })
    .then((response) => {
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      return response.json();
    })
    .then((data) => {
      console.log("Success:", data);
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}

// query record from DB by campaign Id
function queryApiWithId(campaignId) {
  const apiUrl =
    "https://87xb6cvhv2.execute-api.ap-southeast-2.amazonaws.com/Prod/data"; // Replace with the actual API URL (current endpoint is deployed to Olgas account)
  const fullUrl = apiUrl + "?campaignId=" + encodeURIComponent(campaignId);

  fetch(fullUrl, {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
    },
  })
    .then(function (response) {
      console.log(response);
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
      return response.json();
    })
    .then(function (data) {
      console.log(data);

      const resultsElement = document.getElementById("results");
      resultsElement.innerHTML = "";

      data.forEach(function (item) {
        const itemElement = document.createElement("p");
        itemElement.textContent = JSON.stringify(item);
        resultsElement.appendChild(itemElement);
      });
    })
    .catch(function (error) {
      console.error("Error fetching data:", error);
      document.getElementById("results").innerText = "Error: " + error.message;
    });
}

// Event listener for the submit buttons
window.onload = function () {

  // post request
  document
    .getElementById("contactSubmitButton")
    .addEventListener("click", function () {
      const input = document.getElementById("contactInput").value;
      const parts = input.split(" ");

      const campaignId = parts[0];
      const phone = parts[1];

      if (parts.length === 2) {
        sendToApiGateway(campaignId, phone);
      } else {
        alert("Please enter a name and a phone number separated by a space.");
      }
      document.getElementById("contactInput").value = ""; // Clear the input field
    });

  // get request
  document
    .getElementById("idSubmitButton")
    .addEventListener("click", function () {
      const inputId = document.getElementById("idInput").value;
      if (!inputId) {
        alert("Please enter an ID.");
        return;
      }
      queryApiWithId(inputId);

      document.getElementById("idInput").value = ""; 
    });
};
