document.addEventListener('DOMContentLoaded', function() {
  const iconPicker = document.getElementById('icon-picker');
  const iconPreview = document.getElementById('icon-preview').querySelector('i');

  // Asegúrate de que el iconPicker existe
  if (iconPicker) {
    iconPicker.addEventListener('change', function() {
      console.log("Icon selected: " + this.value); // Mensaje de depuración
      iconPreview.className = this.value; // Actualiza la clase del ícono
    });
  } else {
    console.log("Icon picker not found!"); // Mensaje de depuración
  }
});

