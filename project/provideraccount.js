// Fetching and displaying bookings dynamically
function fetchBookings() {
    // Make an AJAX request to the server (PHP) to fetch booking data
    // This example uses the fetch API to demonstrate; you might use other methods like XMLHttpRequest or jQuery.ajax
    fetch('provideraccount.php?action=getBookings')
        .then(response => response.json())
        .then(data => {
            const bookingList = document.querySelector('.booking-list');

            // Clear any existing list items
            bookingList.innerHTML = '';

            data.forEach(booking => {
                const li = document.createElement('li');
                li.textContent = booking.details;

                // Append each booking to the list
                bookingList.appendChild(li);
            });
        })
        .catch(error => {
            console.error('Error fetching bookings: ', error);
        });
}

// Accept or reject a booking
function handleBookingDecision(action) {
    // action will be 'accept' or 'reject'
    // Send a request to the server to perform the action on the selected booking
    const bookingId = getSelectedBookingId(); // Function to get the selected booking ID

    fetch('provideraccount.php?action=' + action + '&bookingId=' + bookingId)
        .then(response => {
            // Handle the response accordingly
            // Maybe update the interface, remove the booking from the list, etc.
            fetchBookings(); // Update bookings after performing an action
        })
        .catch(error => {
            console.error('Error processing booking: ', error);
        });
}

// Function for sending a message
function sendMessage(message) {
    // Send the message to the server
    fetch('provideraccount.php?action=sendMessage&message=' + message)
        .then(response => {
            // Handle the response - maybe update the notifications, etc.
        })
        .catch(error => {
            console.error('Error sending message: ', error);
        });
}

// Profile update functionality
function updateProfileDetails(newPhoneNumber) {
    fetch('provideraccount.php?action=updateProfile&phoneNumber=' + newPhoneNumber)
        .then(response => {
            // Handle the response - update the profile details or show a success message
        })
        .catch(error => {
            console.error('Error updating profile: ', error);
        });
}

// Event listeners for buttons, forms, etc.
document.addEventListener('DOMContentLoaded', function() {
    fetchBookings(); // Initial fetch of bookings when the page loads

    document.querySelector('.accept-booking').addEventListener('click', () => {
        handleBookingDecision('accept');
    });

    document.querySelector('.reject-booking').addEventListener('click', () => {
        handleBookingDecision('reject');
    });

    document.querySelector('.send-message').addEventListener('click', () => {
        const message = document.querySelector('.messaging-container textarea').value;
        sendMessage(message);
    });

    document.querySelector('.update-account').addEventListener('click', () => {
        const newPhoneNumber = document.querySelector('.account-details input[type="text"]').value;
        updateProfileDetails(newPhoneNumber);
    });
});
