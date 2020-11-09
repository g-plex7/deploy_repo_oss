document.addEventListener('DOMContentLoaded', function () {
    // get all "navbar burger" elements
    var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0)

    // check if there are any navbar burgers 
    if ($navbarBurgers.length > 0) {
        $navbarBurgers.forEach(function (el) {
            el.addEventListener('click', function () {

                // get the target from the "data-target" attribute
                var target = el.dataset.target; 
                var $target = document.getElementById(target); 

                // toggle the class on both the "navbar-burger" and the "navbar-menu"
                el.classList.toggle('is-active'); 
                $target.classList.toggle('is-active')
            })
        })
    }
})