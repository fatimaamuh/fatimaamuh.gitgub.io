// MyAccount.js

const editButton = document.getElementById('edit-button');
const saveButton = document.getElementById('save-button');
const editForm = document.querySelector('.edit-form');
const usernameSpan = document.getElementById('username');
const emailSpan = document.getElementById('email');
const numberSpan = document.getElementById('number'); // Added this line
const regionSpan = document.getElementById('Region'); // Added this line
const newUsernameInput = document.getElementById('new-username');
const newEmailInput = document.getElementById('new-email');
const newNumberInput = document.getElementById('new-number'); // Added this line
const newRegionSelect = document.getElementById('new-Region'); // Added this line

editButton.addEventListener('click', () => {
    editForm.style.display = 'block';
    editButton.style.display = 'none';
});

saveButton.addEventListener('click', () => {
    usernameSpan.textContent = newUsernameInput.value;
    emailSpan.textContent = newEmailInput.value;
    numberSpan.textContent = newNumberInput.value; // Added this line
    regionSpan.textContent = newRegionSelect.value; // Added this line
    editForm.style.display = 'none';
    editButton.style.display = 'block';
});
