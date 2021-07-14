document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('new_bazaar')){
    const ImageBazaar = document.getElementById('image_bazaar');

    const createImageHTML = (imageURL) => {
      const divElement = document.createElement('div');
      const image = document.createElement('img');
      image.setAttribute('src', imageURL);

      divElement.appendChild(image);
      ImageBazaar.appendChild(divElement);
    };

    document.getElementById('bazaar_image').addEventListener('change', function(e){

      const imageContent = ImageBazaar.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const imageURL = window.URL.createObjectURL(file);

      createImageHTML(imageURL);
    });
  }
});