// Initialize AWS
function initializeAWS() {
  AWS.config.update({
    region: "ap-southeast-2",
  });
}

// Function to send data to API Gateway
function sendToApiGateway(name, phone) {
  const apiUrl =
    "https://1phczcq88h.execute-api.ap-southeast-2.amazonaws.com/Prod/message"; // Replace with your actual API Gateway URL
  const data = {
    uniqueId:
      "id" + Date.now().toString(36) + Math.random().toString(36).substr(2, 9),
    name: name,
    name: name,
    phone: phone,
  };

  fetch(apiUrl, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      // any other necessary headers
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
      document.getElementById("response").innerHTML +=
        "Response for " + name + ": " + JSON.stringify(data) + "<br>";
    })
    .catch((error) => {
      console.error("Error:", error);
      document.getElementById("response").innerHTML +=
        "Error for " + name + ": " + error + "<br>";
    });
}

// Event listener for the submit button
window.onload = function () {
  initializeAWS();

  document
    .getElementById("submitButton")
    .addEventListener("click", function () {
      const input = document.getElementById("contactInput").value;
      const parts = input.split(" ");
      if (parts.length === 2) {
        sendToApiGateway(parts[0], parts[1]);
      } else {
        alert("Please enter a name and a phone number separated by a space.");
      }

      document.getElementById("contactInput").value = ""; // Clear the input field
    });
};
