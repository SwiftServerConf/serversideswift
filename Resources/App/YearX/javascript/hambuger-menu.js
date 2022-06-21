  function toggleHamburger() {
    const button = document.querySelector('.hamburger');
    const nav = document.querySelector('.navigation');
    
    toggleClass(button);
    toggleClass(nav);
  }

  function toggleClass(element) {
    const isActiveClass = "is-active";
    if (element.classList.contains(isActiveClass)) {
      element.classList.remove(isActiveClass)
    } else {
      element.classList.add(isActiveClass)
    }
  }
