'use strict'
// preloader
window.addEventListener("load", function(){
    document.getElementById("loader").classList.toggle("loaderend");
    
});

document.addEventListener("DOMContentLoaded", ()=> {
    // cerrar navbar menu mobile al hacer click en un link
    let subbar = document.getElementById("navbarSupportedContent");
    let menu = document.getElementById("btnmenu");
    for (let navItem of document.querySelectorAll("a.nav-link")) {
        navItem.addEventListener("click", ()=> {
            menu.classList.remove("opened");
            menu.classList.add("collapsed");
            menu.setAttribute("aria-expanded", false);
            subbar.classList.remove("show");
        });
        }
    // header animacion
    document.getElementById("home").firstElementChild.classList.add("fade-in-top");

    //slider drag
    const slider = document.querySelector('.slider_container');
    let isDown = false;
    let startX;
    let scrollLeft;

    slider.addEventListener('mousedown', (e) => {
    isDown = true;
    slider.classList.add('active');
    startX = e.pageX - slider.offsetLeft;
    scrollLeft = slider.scrollLeft;
    });

    slider.addEventListener('mouseleave', () => {
    isDown = false;
    slider.classList.remove('active');
    });

    slider.addEventListener('mouseup', () => {
    isDown = false;
    slider.classList.remove('active');
    });

    slider.addEventListener('mousemove', (e) => {
    if(!isDown) return;
    e.preventDefault();
    const x = e.pageX - slider.offsetLeft;
    const walk = (x - startX) * 3; //scroll-fast
    slider.scrollLeft = scrollLeft - walk;
    });

    // filtros
    const btnfilter = document.querySelectorAll(".filters li");
    const service = document.querySelectorAll(".item");

    btnfilter.forEach(item =>{
        item.addEventListener("click", function(){
            for(let i = 0; i < btnfilter.length; i++){
                btnfilter[i].classList.remove("active");
            }
            item.classList.add("active");
            //mostrar filtro
            service.forEach(show=>{
                show.classList.add("fade-out-left");
                show.style.display = "none";
                let services = item.textContent.toLowerCase();
                if(show.getAttribute("data-att") === services || services === "all"){
                    show.classList.add("fade-in-left");
                    show.style.display = "inline-block";
                }
            })
        })
    });
});