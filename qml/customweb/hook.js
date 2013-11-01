var intercept = function(submitButton, parseFunction) {

    var parse = function(keyClass, valClass){
        var kClass = keyClass || 'key'
        var vClass = keyClass || 'val'
        var keys = document.querySelectorAll('.' + kClass);
        var vals = document.querySelectorAll('.' + vClass);
        var data = []
        for(var i = 0; i < keys.length; i++){
            var obj = {}
            var key = keys[i].innerText.toLowerCase()
            obj[key] = vals[i].value || vals[i].innerHTML
            data.push(obj)
        }

        return JSON.stringify(data);
    }

    var button = submitButton || 'submit'
    var parseFunc = parseFunction || parse

    setTimeout(function(){
        $('#' + button).click(function(e){
            e.preventDefault();
            if (window.hook) {
                window.hook.process(parseFunc());
            }
        })
    }, 100)
}
