document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('new_auction')){
    const ImageBazaar = document.getElementById('image_auction');

    document.getElementById('order_auction_image').addEventListener('change', function(e){
      const createImageHTML = (imageURL) => {

        const text = document.getElementById('text_auction')
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