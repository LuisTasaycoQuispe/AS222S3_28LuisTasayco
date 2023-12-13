document.getElementById('metodoBusqueda').addEventListener('change', function () {
    var opcion = this.value;

    var inputBusqueda = document.getElementById('inputBuscar');

    if (opcion === 'celular') {
        inputBusqueda.placeholder = 'Ingresar celular';
    } else if (opcion === 'DNI') {
        inputBusqueda.placeholder = 'Ingresar dni';
    } else {
        inputBusqueda.placeholder = 'ingresar nombres';
    }
});






// Mostrar ventana de registrar registrar Alumno

const exampleModal = document.getElementById('exampleModal')
if (exampleModal) {
    exampleModal.addEventListener('show.bs.modal', event => {
        const button = event.relatedTarget
        const recipient = button.getAttribute('data-bs-whatever')

        const modalTitle = exampleModal.querySelector('.modal-title')
        const modalBodyInput = exampleModal.querySelector('.modal-body input')

        modalTitle.textContent = `Registrar Estudiante`
        modalBodyInput.value = recipient
    })
}



