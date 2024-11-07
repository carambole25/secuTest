// Get references to the card, waves, and wave-container
const card = document.getElementById('draggable-card');
const waveContainer = document.querySelector('.wave-container');
const waveElements = document.querySelectorAll('.wave');

let cardFront = true;
let cardContent = {
    "img": "https://picsum.photos/900/600",
    "question": "Ce code est il sécurisé ?",
    "response": "Non, il ne l'est pas parceque...",
    "answer": false,
}

document.querySelector('#questionImage').src = cardContent.img;
document.querySelector('#question').innerHTML = cardContent.question;
// document.querySelector('#response').innerHTML = cardcontent.response;

// Combine wave-container and waves into a single array
const waves = [waveContainer, ...waveElements];

// Variables to track dragging state
let isDragging = false;
let isDisappearing = false; // Tracks if the card is disappearing
let startX = 0;
let offsetX = 0;

// Define RGB color arrays for each wave, including wave-container
const blueColors = [
    [65, 105, 225], // wave-container lighter blue (RoyalBlue)
    [0, 0, 139],    // wave1 darkblue
    [0, 0, 112],    // wave2 #000070
    [0, 0, 55]      // wave3 #000037
];

const redColors = [
    [255, 69, 0],   // wave-container lighter red (OrangeRed)
    [139, 0, 0],    // wave1 darkred
    [112, 0, 0],    // wave2 #700000
    [55, 0, 0]      // wave3 #370000
];

const greenColors = [
    [60, 179, 113], // wave-container lighter green (MediumSeaGreen)
    [0, 100, 0],    // wave1 darkgreen
    [0, 112, 0],    // wave2 #007000
    [0, 55, 0]      // wave3 #003700
];

// Function to interpolate between two colors
function interpolateColor(color1, color2, factor) {
    const result = color1.slice();
    for (let i = 0; i < 3; i++) {
        result[i] = Math.round(result[i] + factor * (color2[i] - color1[i]));
    }
    return result;
}

// Set initial colors on page load
function setInitialColors() {
    waves.forEach((wave, index) => {
        const color = blueColors[index];
        wave.style.background = `rgb(${color[0]}, ${color[1]}, ${color[2]})`;
    });
}

// Initialize the colors on page load
setInitialColors();

// Mouse and touch down event to start dragging
function onDragStart(e) {
    if (isDisappearing) return; // Prevent dragging while disappearing
    isDragging = true;
    const clientX = e.type === 'touchstart' ? e.touches[0].clientX : e.clientX;
    startX = clientX - offsetX;
    card.style.cursor = 'grabbing';

    // Add move and end listeners
    document.addEventListener('mousemove', onDragMove);
    document.addEventListener('mouseup', onDragEnd);
    document.addEventListener('touchmove', onDragMove, { passive: false });
    document.addEventListener('touchend', onDragEnd);
}

// Mouse and touch move event while dragging
function onDragMove(e) {
    if (!isDragging || isDisappearing) return;

    // Prevent scrolling on touch devices while dragging
    if (e.type === 'touchmove') {
        e.preventDefault();
    }

    const clientX = e.type === 'touchmove' ? e.touches[0].clientX : e.clientX;
    offsetX = clientX - startX;
    let offsetY = offsetX > 0 ? offsetX / 2 : -offsetX / 2;

    // Set both horizontal translation and rotation based on offsetX
    const rotationAngle = offsetX * 0.1; // Adjust multiplier for more/less rotation

    // Apply transform with scale(1) when not disappearing
    card.style.transform = `translateX(${offsetX}px) translateY(${offsetY}px) rotate(${rotationAngle}deg) scale(1)`;

    // Handle wave color changes
    handleMove(clientX);
}

// Mouse and touch up event to stop dragging
function onDragEnd(e) {
    if (!isDragging || isDisappearing) return;
    isDragging = false;
    card.style.cursor = 'grab';

    // Remove move and end listeners
    document.removeEventListener('mousemove', onDragMove);
    document.removeEventListener('mouseup', onDragEnd);
    document.removeEventListener('touchmove', onDragMove);
    document.removeEventListener('touchend', onDragEnd);

    // Detect proximity to screen edges
    const cardWidth = card.offsetWidth;
    const windowWidth = window.innerWidth;
    const currentX = (windowWidth / 2) + offsetX;

    if ((currentX - (cardWidth / 2) <= 100) || (currentX + (cardWidth / 2) >= windowWidth - 100)) {
        isDisappearing = true;

        // Start disappearing animation
        const rotationAngle = offsetX * 0.1;
        let offsetY = offsetX > 0 ? offsetX / 2 : -offsetX / 2;
        card.style.transition = 'transform 0.5s ease, opacity 0.5s ease';
        card.style.transform = `translateX(${offsetX}px) translateY(${offsetY}px) rotate(${rotationAngle}deg) scale(0)`;
        card.style.opacity = '0';

        // Reset waves to blue
        setInitialColors();

        // Listen for transition end to reset the card
        card.addEventListener('transitionend', onTransitionEnd);
        if (cardFront) {
            removeButton()
            document.querySelector("#question").innerHTML = cardContent["response"]
        }
        else {
            addButton()
            getQuestion()
            document.querySelector("#question").innerHTML = cardContent["question"]
        }
        cardFront = !cardFront
    } else {
        // Reset position and transform
        offsetX = 0;
        card.style.transform = `translateX(0px) translateY(0px) rotate(0deg) scale(1)`;

        // Reset waves to blue
        setInitialColors();
    }
}

// Transition end event to reset the card after disappearing
function onTransitionEnd(e) {
    if (e.propertyName === 'opacity' && isDisappearing) {
        // Reset card position and styles
        offsetX = 0;
        card.style.transition = '';
        card.style.transform = 'translateX(0px) translateY(0px) rotate(0deg) scale(1)';
        card.style.opacity = '1';

        // Reset waves to blue
        setInitialColors(); // <-- Added this line

        // Reset isDisappearing
        isDisappearing = false;

        // Remove transitionend listener
        card.removeEventListener('transitionend', onTransitionEnd);
    }
}

// Handle move to change wave colors based on position
function handleMove(clientX) {
    const width = window.innerWidth;
    const height = window.innerHeight;

    // Check if the screen is in landscape mode
    if (width > height) {
        // Calculate intensity based on distance from the edge
        const intensityLeft = Math.max(0, (width / 3 - clientX) / (width / 2));
        const intensityRight = Math.max(0, (clientX - (width) / 2) / (width / 2));

        if (intensityLeft > 0) {
            // Interpolate between blue and red
            waves.forEach((wave, index) => {
                let newColor = interpolateColor(blueColors[index], redColors[index], intensityLeft);
                wave.style.background = `rgb(${newColor[0]}, ${newColor[1]}, ${newColor[2]})`;
            });
        } else if (intensityRight > 0) {
            // Interpolate between blue and green
            waves.forEach((wave, index) => {
                let newColor = interpolateColor(blueColors[index], greenColors[index], intensityRight);
                wave.style.background = `rgb(${newColor[0]}, ${newColor[1]}, ${newColor[2]})`;
            });
        } else {
            // Set waves back to blue
            setInitialColors();
        }
    } else {
        // In portrait mode, keep waves at their initial color
        setInitialColors();
    }
}


// Add event listeners for mouse and touch
card.addEventListener('mousedown', onDragStart);
card.addEventListener('touchstart', onDragStart, { passive: false });

// Optional JavaScript to vary wave speed dynamically
waveElements.forEach((wave, index) => {
    wave.style.animationDuration = `${8 + index * 2}s`;
    wave.style.animationDelay = `${index * 2}s`;
});

// Add references to the buttons
const buttonFalse = document.getElementById('button-false');
const buttonTrue = document.getElementById('button-true');

// Add event listeners to the buttons
buttonFalse.addEventListener('click', () => handleButtonClick('left'));
buttonTrue.addEventListener('click', () => handleButtonClick('right'));

// Function to handle button clicks
function handleButtonClick(direction) {
    if (isDisappearing) return; // Prevent interaction while card is disappearing
    isDisappearing = true;

    // Determine the target offsetX and rotation based on the direction
    const windowWidth = window.innerWidth;
    const cardWidth = card.offsetWidth;
    let targetOffsetX;
    let rotationAngle;

    if (direction === 'left') {
        // Move to the left edge
        targetOffsetX = - (windowWidth / 2) - (cardWidth);
        rotationAngle = -30; // Adjust rotation angle as desired

        // Set wave colors to red (similar to dragging left)
        waves.forEach((wave, index) => {
            const color = redColors[index];
            wave.style.background = `rgb(${color[0]}, ${color[1]}, ${color[2]})`;
        });
    } else {
        // Move to the right edge
        targetOffsetX = (windowWidth / 2) + (cardWidth);
        rotationAngle = 30; // Adjust rotation angle as desired

        // Set wave colors to green (similar to dragging right)
        waves.forEach((wave, index) => {
            const color = greenColors[index];
            wave.style.background = `rgb(${color[0]}, ${color[1]}, ${color[2]})`;
        });
    }

    // Apply the disappearing animation
    card.style.transition = 'transform 0.5s ease, opacity 0.5s ease';
    card.style.transform = `translateX(${targetOffsetX}px) translateY(0px) rotate(${rotationAngle}deg) scale(0)`;
    card.style.opacity = '0';

    // Listen for transition end to reset the card
    card.addEventListener('transitionend', onTransitionEnd);
    if (cardFront) {
        document.querySelector("#question").innerHTML = cardContent["response"]
        removeButton()
    }
    else {
        getQuestion()
        addButton()
        document.querySelector("#question").innerHTML = cardContent["question"]
    }
    cardFront = !cardFront
}


function getQuestion() {
    cardContent = {
        "img": "https://picsum.photos/900/600",
        "question": "Ce code est il sécurisé ?",
        "response": "Non, il ne l'est pas parceque...",
        "answer": false,
    }
}

function addButton() {
    // Create a new div element
    const button = document.createElement('div');

    // Set the id, class, and text content
    button.id = 'button-false';
    button.className = 'button';
    button.textContent = 'x';

    // Select the container element
    const container = document.querySelector('.buttons-container');

    // Append the button to the container
    if (container) {
        container.insertBefore(button, container.firstChild);
        const buttonFalse = document.getElementById('button-false');
        buttonFalse.addEventListener('click', () => handleButtonClick('left'));

    } else {
        console.error('Element with ID "buttons-container" not found.');
    }
}

function removeButton() {
    const button = document.querySelector('#button-false');
    if (button) {
        button.parentNode.removeChild(button);
    } else {
        console.error('Element with ID "button-false" not found.');
    }
}
