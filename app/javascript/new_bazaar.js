document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('new_bazaar')){
    const ImageBazaar = document.getElementById('image_bazaar');

    document.getElementById('bazaar_image').addEventListener('change', function(e){
      const createImageHTML = (imageURL) => {

        const text = document.getElementById('text_bazaar')
        const divElement = document.createElement('div');
        const image = document.createElement('img');
        image.setAttribute('src', imageURL);

        divElement.appendChild(image);
        ImageBazaar.appendChild(divElement);
        text.remove();
      };

      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const imageURL = window.URL.createObjectURL(file);

      createImageHTML(imageURL);
    });
  }
});