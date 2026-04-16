const LARGO_MAXIMO = 150

function asignarResumenDeDescripcion(resumen, descripcion){
    if( descripcion.innerHTML.length > LARGO_MAXIMO){
        resumen.innerHTML = descripcion.innerHTML.substring(0, LARGO_MAXIMO) + '...'
    } else {
        resumen.innerHTML = descripcion.innerHTML
    }
}

function main(){
    let habitaciones = document.getElementsByClassName('habitacion')

    for (let i = 0; i < habitaciones.length; i++) {
        let habitacion = habitaciones[i]
        let botonLeerMas = habitacion.querySelector('.leer-mas')
        let botonCerrarInfo = habitacion.querySelector('.cerrar-info-boton')
        let bloqueInfoH = habitacion.querySelector('.bloque-informacion-h')
        let descripcion = habitacion.querySelector('.texto-descripcion')
        let resumen = habitacion.querySelector('.mini-descripcion')

        asignarResumenDeDescripcion(resumen, descripcion)
        
        botonLeerMas.addEventListener('click', () => {
            bloqueInfoH.style.display = 'flex'
            setTimeout(()=>{
                bloqueInfoH.classList.add('mostrar')
            }, 5)
        })
        
        botonCerrarInfo.addEventListener('click', () => {
            bloqueInfoH.style.display = 'none'
        })
    
    }
}

main();




