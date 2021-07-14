document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('new_company')){
    const ImageProfile = document.getElementById('image');

    const createImageHTML = (imageURL) => {
      const divElement = document.createElement('div');
      const image = document.createElement('img');
      image.setAttribute('src', imageURL);

      divElement.appendChild(image);
      ImageProfile.appendChild(divElement);
    };

    document.getElementById('image_form').addEventListener('change', function(e){

      const imageContent = ImageProfile.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const imageURL = window.URL.createObjectURL(file);

      createImageHTML(imageURL);
    });
  }
});