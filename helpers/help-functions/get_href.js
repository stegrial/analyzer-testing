(function nodeTree () {
    var objects = document.querySelectorAll('link[rel=stylesheet], img');

    function getHref(objects, keys) {
        var result = [];

        for (var object of objects) {
            for (var key of keys) {
                var val = object[key];
                if (val && val.length > 0) {
                    result.push(val);
                }
            }
        }
        return result;
    }

    var href = getHref(objects, ['href', 'src']);
    return href;
})();
