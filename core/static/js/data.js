export async function shootingPull(search = null, start = null, end = null, dep = null, fat = null, arm = null, gang = null) {
  const data = {
      "gang": gang,
      "search": search,
      "start": start,
      "end": end,
      "dep": dep,
      "fat": fat,
      "arm": arm
  };

  try {
    // Sending a POST request
    const response = await fetch('/shooting-json', {
      method: 'POST',             // Specify the request method as POST
      headers: {
        'Content-Type': 'application/json'  // Specify that you're sending JSON data
      },
      body: JSON.stringify(data)  // Convert your data to a JSON string
    });

    // Check if the response is OK (status 200-299)
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }

    // Parse the response JSON data
    const responseData = await response.json();
    
    // Log the parsed response data
    // console.log(responseData);

    // Return the parsed JSON data
    return responseData;
    
  } catch (error) {
    console.error('There was a problem with the POST request:', error);
  }
}

