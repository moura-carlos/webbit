document.addEventListener("turbolinks:load", () => {
  const dropDownLinks = document.querySelectorAll(".js-nav .dropdown a");
  const dropDownMenu = document.querySelector(".dropdown-menu");


  function dropdown(){
    dropDownLinks.forEach(function(dropdown) {
      dropdown.addEventListener("click", (e) => {
        const dropdownTarget = dropdown.nextElementSibling;
        if (e.target.nextElementSibling != null){
          // Hide the dropdown
          dropdownTarget.classList.toggle("hidden");
          // Click outside dropdown to also close
          hideOnClickOutside(dropdown);
          e.preventDefault();
        }
      })
    });
  }

  function hideOnClickOutside(element) {
    const outsideClickListener = function(event) {
      if(!element.contains(event.target)) {
        if (!!element && !!(element.offsetWidth || element.offsetHeight || element.getClientRects().length)) {
          element.nextElementSibling.classList.toggle('hidden');
          removeClickListener();
        }
      }
    }
    const removeClickListener = function() {
      document.removeEventListener("click", outsideClickListener);
    }

    document.addEventListener("click", outsideClickListener);
  }

  function init() {
    dropdown();
  }

  init();
  /*const dropdown = document.querySelector(".js-dropdown-user-target");
  const dropdownList = document.querySelector(".dropdown-list");

  dropdown.addEventListener("click", (e) => e.preventDefault());

  document.addEventListener("click", (e) => {
    if (e.target.closest(".dropdown")) {
      // hide dropdown if click target is the dropdown element
      dropdownList.classList.remove("hidden");
    } else {
      // remove dropdown if no target is the dropdown element
      dropdownList.classList.add("hidden");
    }
  });*/
});
