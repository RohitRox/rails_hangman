var words = [
'cat', 'tree', 'swing', 'around', 'scientist'
];

// This function will pick our word
function chooseWord () {
    // Write code here
    var len = words.length();
    choosen = Math.floor(Math.random()*len);
    return word[len];
    
}

function blanksFromAnswer ( answerWord ) {
    
    var result = ""; // This is the variable we want to use
    
    // Write a loop here to concatanate a '_' to result for
    // every letter in answerWord.
    var i = 0;
    do{
    	result += "_";
    	i += 1;
    }
    while(i < answerWord.length);

    return result;
}

