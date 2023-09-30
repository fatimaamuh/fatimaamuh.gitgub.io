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
    if (textIndex < texts.length && charIndex < texts[textIndex].length) {
        textContainer.textContent += texts[textIndex].charAt(charIndex);
        charIndex++;
        setTimeout(typeText, 50); // Adjust typing speed here
    }
}

// Start the typing animation
typeText();
