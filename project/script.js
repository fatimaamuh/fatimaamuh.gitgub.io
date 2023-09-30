// JavaScript code for the typing effect
const texts = [
    "Say goodbye to endless phone calls and confusing scheduling processes.",
    "With our user-friendly platform, booking your desired service",
    "is as easy as a few clicks(;"
];

const textContainer = document.getElementById("typing-text");
let textIndex = 0;
let charIndex = 0;

function typeText() {
    if (textIndex < texts.length) {
        if (charIndex < texts[textIndex].length) {
            textContainer.textContent += texts[textIndex].charAt(charIndex);
            charIndex++;
            setTimeout(typeText, 50); // Adjust typing speed here
        } else {
            // Text fully typed, move to the next text
            textIndex++;
            charIndex = 0;

            // Clear the existing text content
            textContainer.textContent = '';

            setTimeout(typeText, 1000); // Pause before typing the next text
        }
    }
}

// Start the typing animation
typeText();
