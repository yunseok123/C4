// Function to show Coaching Staff by default
    function showDefaultCategory() {
        var coachingCategory = 'coaching'; // Replace with your desired default category
        showRoster(coachingCategory);
    }

    // Function to show the selected category
    function showRoster(category) {
        // Hide all player cards
        var playerCards = document.querySelectorAll('.player-card');
        playerCards.forEach(function (card) {
            card.style.display = 'none';
        });

        // Show player cards of the selected category
        var selectedPlayerCards = document.querySelectorAll('.' + category);
        selectedPlayerCards.forEach(function (card) {
            card.style.display = 'block';
        });
    }
    

    // Call the showDefaultCategory function when the page loads
      var selectedRoster = document.querySelector('#sidebar li[data-roster="' + rosterType + '"]');
    selectedRoster.classList.add('active');

    window.onload = showDefaultCategory;