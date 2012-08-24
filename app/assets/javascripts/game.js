function resetGame () {
    resetUI();
    gameAnswer = chooseWord();
    gameShownAnswer = blanksFromAnswer(gameAnswer);
    hangmanState = 0;
    drawWord(gameShownAnswer);    
}

function win () {
 resetGame() ;
    $.ajax({
      type: "POST",
      url: "/win/broadcast",
      data: { score: 23, category: "sports" }
    });
}

function lose () {
 alert('Oh no, you lose!'); resetGame(); 
}

function doKeypress () {
    var tempChar = $('#letter-input').val().toLowerCase();
    var tempString = "";
    $('#letter-input').val("");
    
    // Write here!
    tempString = guessLetter( tempChar, gameShownAnswer, gameAnswer );
    if ( tempString != gameShownAnswer ) {
        updateWord( tempString );
        gameShownAnswer = tempString;
        if ( gameShownAnswer === gameAnswer ) {
            win();
        }
    } else {
        wrongLetter(tempChar);
        drawSequence[ hangmanState++ ]();
        if ( hangmanState === drawSequence.length ) {
            lose();
        }
    }  
}
$(document).ready(function(){

    resetGame();
    $('#letter-input').keyup( function(){ doKeypress() } );



});

$(function() {
  var faye = new Faye.Client('http://hangman-app.herokuapp.com:9292/faye');
  faye.subscribe('/messages/new', function (data) {
    eval(data);
  });
});