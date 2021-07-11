

document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('new_auction')){
    const ImageAuction = document.getElementById('image_auction');

    const createImageHTML = (imageURL) => {
      const divElement = document.createElement('div');
      const image = document.createElement('img');
      image.setAttribute('src', imageURL);

      divElement.appendChild(image);
      ImageAuction.appendChild(divElement);
    };

    document.getElementById('auction_image').addEventListener('change', function(e){

      const imageContent = ImageAuction.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const imageURL = window.URL.createObjectURL(file);

      createImageHTML(imageURL);
    });
  }
});