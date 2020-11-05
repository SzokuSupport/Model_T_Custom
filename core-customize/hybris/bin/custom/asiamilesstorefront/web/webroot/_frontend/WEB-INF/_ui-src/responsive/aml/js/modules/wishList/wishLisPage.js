

    export default function wishListPage() {
        let $wishlistRemoved = $('.wishlist-removed');
        
        $('.wishlist-container').on('click', '.J-removeAlertMessage', function(){
            $wishlistRemoved.remove();
          })

    }
    