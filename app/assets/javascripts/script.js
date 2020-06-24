$(document).ready(function () {

// fadeInDown Animation(index)
    $('.js--ani-1').ready(function (direction) {
        $('.js--ani-1').addClass('animated fadeIn');
    });

// bounce-in(quiz page)
    $('.js--ani-2').ready(function (direction) {
        $('.js--ani-2').addClass('animated bounceIn');
    });

// Multiple select(random quiz setting)
    $('.category').click(function() { 
        $(this).toggleClass('active');
    });

// Share
function share() {
    if (navigator.share) {
        navigator.share({
                title: 'Emoji Quiz',
                text: '이모지퀴즈를 친구들과 풀어보자!',
                url: 'http://3.20.150.130:3000/',
            })
            .then(() => console.log('Emoji shared successfully'))
            .catch((error) => console.log('Error sharing', error));
    } else {
        console.log("Web browser doesn't support share.");
        alert("Your web browser doesn't support share.")
    }
}  

$('a.btn-share').click(function() {
    share();
});

  
// Input 

    document.getElementById("answer").addEventListener("input", function() {
        var answerInput = document.getElementById('answer').value;
        if (answerInput != "") {
            document.getElementById("answerButton").style.backgroundColor = "black";
            document.getElementById("answerButton").style.borderColor = "black";
        } else {
            document.getElementById("answerButton").style.backgroundColor = "#999";
            document.getElementById("answerButton").style.borderColor = "#999";
        }
    });

// Like Button
$(".icon-right.choose").click(function() {
    $(this).toggleClass("ion-md-heart-empty ion-md-heart").addClass('animated bounceIn');
  });

// Reaction?


});
