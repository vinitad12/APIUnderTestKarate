/*
function get_random(){
return Math.floor(Math.random() * 100);
}
// cannot call specific function, so hack is
*/
function() {
    return {
        get_random: function get_random(){
            return Math.floor(Math.random() * 100);
            }
    }
}

