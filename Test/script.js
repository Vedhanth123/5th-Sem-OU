function convert() {
    var input = document.getElementById('input').value;
    var conversionType = document.getElementById('conversionType').value;
    var result;
    if (conversionType === 'dtob') {
        // Decimal to binary
        result = parseInt(input, 10).toString(2);
    } else {
        // Binary to decimal
        result = parseInt(input, 2);
    }
    document.getElementById('result').innerHTML = result;
}
