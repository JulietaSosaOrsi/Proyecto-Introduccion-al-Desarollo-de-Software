document.addEventListener('DOMContentLoaded', function () {
    let modal = document.getElementById('modal');
    let modal_formulario = document.getElementById('modal_formulario');
    let disparador_modal = document.getElementById('disparador_modal');
    let disparador_formulario = document.getElementById('disparador_formulario');
    let cerrar_modal = document.getElementById('cerrar_modal');
    let cerrar_modal_formulario = document.getElementById('cerrar_modal_formulario');

    disparador_modal.addEventListener('click', function () {
        modal.style.display = 'block';
    });
    disparador_formulario.addEventListener('click', function () {
        modal_formulario.style.display = 'block';
    });

    cerrar_modal.addEventListener('click', function () {
        modal.style.display = 'none';
    });
    cerrar_modal_formulario.addEventListener('click', function () {
        modal_formulario.style.display = 'none';
        
    });

    let contenedor_valoracion_total = document.getElementById('valoracion_promedio');
    let valoracion_total = document.getElementById('valoracion_total').innerText;
    mostrarEstrellas(contenedor_valoracion_total, parseInt(valoracion_total));


    let resenas = document.querySelectorAll('.resena');
    resenas.forEach(function (resena) {
        let contenedor_estrellas = resena.querySelector('.valoracion_resena');
        let calificacion = parseInt(resena.querySelector('.calificacion').innerText);
        mostrarEstrellas(contenedor_estrellas, calificacion);
    });

});


function mostrarEstrellas(container, calificacion) {
    const template = document.getElementById('star-rating-template');
    const clone = document.importNode(template.content, true);

    let radios = clone.querySelectorAll('.star-rating-template input[type="radio"]');
    radios.forEach((radio, index) => {
        if (index < calificacion) {
            radio.checked = true;
            radio.nextElementSibling.style.color = 'gold';
        }
    });

    container.appendChild(clone);
}