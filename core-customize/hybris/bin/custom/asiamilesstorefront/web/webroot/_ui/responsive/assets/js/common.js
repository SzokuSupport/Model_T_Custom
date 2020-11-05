$(function() {
	var timeoutEditCount = null;
	var url = {
		cartNumber : $('#urlCartNumber').val(),
		proportion : $('#urlProportion').val(),
		voucherAdd : $('#urlVoucherAdd').val(),
		voucherDel : $('#urlVoucherDel').val()
	}
	var CSRFToken = $('#CSRFToken').val()

	function ajaxCart(type, data) {
		data.CSRFToken = CSRFToken;

		$.ajax({
			url : url[type],
			method : 'post',
			type : 'json',
			data : data
		}).done(function(data) {
			if (!data)
				return

			$('.J-cartNumber').text(data.cartData.totalUnitCount)
			$('#J-cartMile').text(data.cartData.totalPrice)
			$('#J-cartCash').text(data.cartData.totalPriceCash)
			$('#J-cartItem').html(data.page)
			$('#applyPromotionMsgDiv').html($('#applyOrderPromotionDiv').html())
		})
	}

	$('#J-cartItem').on('click', '.J-minus', function() {
		clearTimeout(timeoutEditCount);

		var $this = $(this);
		var $count = $this.siblings('.J-count');
		var count = parseInt($count.val()) - 1;

		if (count === 0) {
			$count.val(1)
			return

		}

		$count.val(count);

		timeoutEditCount = setTimeout(function() {
			var entryNumber = $count.attr('data-entryNumber')
			ajaxCart('cartNumber', {
				entryNumber : entryNumber,
				quantity : count
			})
		}, 200)
	})

	$('#J-cartItem').on('click', '.J-add', function() {
		clearTimeout(timeoutEditCount);

		var $this = $(this);
		var $count = $this.siblings('.J-count');
		var count = parseInt($count.val()) + 1;

		$count.val(count)

		timeoutEditCount = setTimeout(function() {
			var entryNumber = $count.attr('data-entryNumber')

			ajaxCart('cartNumber', {
				entryNumber : entryNumber,
				quantity : count
			})
		}, 200)
	})

	$('#J-cartItem').on(
			'click',
			'.J-cartItemDel',
			function() {
				var $this = $(this);
				var entryNumber = $this.siblings('.J-item-box').children(
						'.J-count').attr('data-entryNumber')

				ajaxCart('cartNumber', {
					entryNumber : entryNumber,
					quantity : 0
				})
			})

	$('#J-cartItem').on('blur', '.J-count', function() {
		var $this = $(this);
		var entryNumber = $this.attr('data-entryNumber')
		var quantity = parseInt($this.val())

		ajaxCart('cartNumber', {
			entryNumber : entryNumber,
			quantity : quantity
		})
	})

	function slide() {
		var value = $("#slider").slider("value")
		// todo
		$.ajax({})
	}

	$("#slider").slider({
		orientation : "horizontal",
		range : "min",
		value : $("#slider").attr('data-sliderValue') || 0,
		min : 0,
		max : 100,
		change : function() {
			var proportion = parseInt($("#slider").slider('value'))

			ajaxCart('proportion', {
				proportion : proportion
			})
		}
	});

	$('.cart-container').on('click', '.J-addCoupon', function() {
		var couponCode = $('.J-couponInput').val();
		ajaxCart('voucherAdd', {
			voucherCode: couponCode,
		}, 300)
	});
	
	$('.cart-container').on('click', '.J-deleteCoupon', function() {
		var deleteCouponCode = $('.J-couponOutput').text();
		ajaxCart('voucherDel', {
			voucherCode : deleteCouponCode,
		}, 300)
	})
})

$(function() {
	$('.form-item').each(function(index) {
		var $this = $(this);
		var $label = $this.siblings('.form-label');
		var placeholder = $label.text();

		$this.attr('placeholder', placeholder).attr('id', 'label' + index)
		$label.attr('for', 'label' + index)

		$this.on('blur', function() {
			var value = $this.val()

			if (!value) {
				$label.addClass('move')
				$this.addClass('empty')
				$this.attr('placeholder', placeholder)
			} else {
				$label.removeClass('move')
				$this.removeClass('empty')
			}

		})

		$this.on('focus', function() {
			$this.attr('placeholder', '')
			$label.removeClass('move')
			$this.removeClass('empty')
		})
	})
})
$(function() {
	var $userInfo = $('#J-userInfoHeader')
	var $accountNav = $('#J-accountNav')
	var timeoutHide = null

	$userInfo.on('mouseover', function() {
		clearTimeout(timeoutHide)
		$accountNav.css('display', 'block')
	})

	$userInfo.on('mouseout', function() {
		timeoutHide = setTimeout(function() {
			$accountNav.hide()
		}, 100)
	})

	$accountNav.on('mouseover', function() {
		clearTimeout(timeoutHide)
	})

	$accountNav.on('mouseout', function() {
		timeoutHide = setTimeout(function() {
			$accountNav.hide()
		}, 100)
	})
})
$(function () {
  if(!$(".js-slick").length) return
  $(".js-slick").slick({
    dots: false,
    arrows: true,
    infinite: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 5000,
	centerMode: true,
	variableWidth: true,
	centerPadding: '50px',
	speed: 500,
	// prevArrow: $('.prev-arrow'),
	// nextArrow: $('.next-arrow'),
	nextArrow: '<img class="slick-arrow slick-right-arrow" src="/_ui/responsive/assets/svg/slick-arrow.svg">',
	prevArrow: '<img class="slick-arrow slick-left-arrow"  src="/_ui/responsive/assets/svg/slick-arrow.svg">',
  });
  $('.slick-arrow').on('click', function() {
	  $('.slick-arrow').hide()
	  setTimeout(function() {
		  $('.slick-arrow').show()
	  }, 400)
  })
})
$(function() {
	var $login = $('.J-login')
	var $miniCart = $('.minicart')
	var $showMiniCartList = $('#J-showMiniCartList a')
	var $miniCartLists = $('#J-miniCartLists')
	var $countrySwitch = $('.countries')

	var timeoutMiniCartHide = null

	function openLogin() {
		$login.show().css('opacity', 1)
	}

	function closeLogin() {
		$login.hide().css('opacity', 0)
	}

	$('.J-showLogin').on('click', function() {
		openLogin()
	})

	$('.login-mask').on('click', function() {
		closeLogin()
	})

	$login.find('.J-close').on('click', function() {
		$('.login-mask').trigger('click')
	})

	$miniCart.find('.J-close').on('click', function() {
		$miniCart.hide()
	})

	$miniCartLists.find('.J-close').on('click', function() {
		$miniCartLists.hide()
	})

	$showMiniCartList.on('mouseover', function() {
		clearTimeout(timeoutMiniCartHide)

		$.ajax({
			url : '/cart/rollover/miniCart',
			method : 'get',
			dataType : 'html'
		}).done(function(data) {
			$miniCartLists.html(data)
			$miniCartLists.show()
		})
	})

	$showMiniCartList.on('mouseout', function() {
		timeoutMiniCartHide = setTimeout(function() {
			$miniCartLists.hide()
		}, 200)
	})

	$miniCartLists.on('mouseover', function() {
		clearTimeout(timeoutMiniCartHide)
	})

	$miniCartLists.on('mouseout', function() {
		timeoutMiniCartHide = setTimeout(function() {
			$miniCartLists.hide()
		}, 200)
	})

	$('.slider-close-btn').on('click', function() {
		$countrySwitch.hide()
		$('.trangle-arrow ').css('opacity', '0')
	})
	$('#J-deliveryCountry').on('click', function() {
		$countrySwitch.show()
		$('.trangle-arrow ').css('opacity', '1')
	})
})
$(function() {
	var $points = $('#pay-in-points-value')
	var $price = $('#pay-in-dollar-value');
	var cost = $('.product-cost').attr('value'); // product cost
	var bu = $('.product-bu').attr('value');
	var max = Math.abs($('.product-totalmiles').attr('value')).toFixed(0); // total miles
	var min = parseInt($('.product-min').attr('value'));
	$price.val(0);

	console.log(cost, max, min, bu)

	$("#J-cashMiles").slider({
		orientation : "horizontal",
		range : "min",
		value : max,
		min : min,
		max : max,
		slide : function(event, ui) {
			var exchangeMiles = ui.value
			var payInDollar = (Math.abs(cost - exchangeMiles * bu)).toFixed(0)
			$points.val(exchangeMiles)
			$price.val(payInDollar)
		},
	});

	var miles = $("#J-cashMiles").slider('value');
	$points.val(miles);
});
$(function() {
	$('.sub-image-item').each(function(index) {
		var $this = $(this);
		var $src = $this.find("img").attr("src"); // 获取图片地址

		$(this).on('click', function() {
			$('.main-image').find("img").attr("src", $src); // 对应地址替换
		})
	})
})

$(function() {
	var productCodePost = $('#J-productCodePost').val()
	var CSRFToken = $('#CSRFToken').val()
	var urlAddToCart = $('#urlAddToCart').val()
	var proportion = $('#J-cashMiles').slider('value')

	$('#J-addToCart').on('click', function() {
		$.ajax({
			url : urlAddToCart,
			method : 'post',
			type : 'json',
			data : {
				productCodePost : productCodePost,
				qty : 1,
				proportion : proportion,
				CSRFToken : CSRFToken
			}
		}).done(function(data) {
			$('.J-cartNumber').text(data.cartData.totalUnitCount)
			$('#J-miniCartAddProduct').html(data.page)

			$('#J-miniCartAddProduct').show()

			setTimeout(function() {
				$('#J-miniCartAddProduct').hide()
			}, 3000)
		})
	})
});
$(function() {
	$("#filter-range").slider({
		orientation : "horizontal",
		range : true,
		values : [ 0, 50000 ],
		min : 0,
		max : 50000,
	});
});
$(function() {
	var $open = $('.J-open');
	var $close = $('.J-close');

	$('.J-toggle-arrow').on('click', function() {
		$close.toggleClass('hide');
		$open.toggleClass('hide');
		$('.category-container').toggleClass('hide');
	});
    $('.search').on('click','.J-searchAction', function() {
		var $input = $('.J-searchProductInput').val();
		console.log($input,8888)
		// window.location.href = `/en/search?text=${$input}`;
        $('.J-searchAction').attr('href', '/en/search?text=${$input}');
    });
});
$(function() {
	var productType = $('#product-type');
	productType.on('change',function(){
		var selectOption = $('#product-type option:selected').val();
		var currentQ = $("#currentQ").val();
		var key = "productType:";
		var idx = currentQ.indexOf(key);
		if(idx==-1){
			currentQ = currentQ+":productType:"+selectOption;
		}else if(currentQ.indexOf(":",idx+key.length)==-1){
			currentQ = currentQ.substring(0,idx+key.length)+selectOption;
		}else{
			currentQ = currentQ.substring(0,idx+key.length)+selectOption+currentQ.substring(currentQ.indexOf(":",idx+key.length));
		}
		window.location.href='/en/search?q='+currentQ;
	});
	
	var avaliableCountry = $('#avaliable-country');
	avaliableCountry.on('change',function(){
		var selectOption = $('#avaliable-country').val();
		var currentQ = $("#currentQ").val();
		var key = "deliveryRegion:";
		var idx = currentQ.indexOf(key);
		if(idx==-1){
			currentQ = currentQ+":"+key+selectOption;
		}else if(currentQ.indexOf(":",idx+key.length)==-1){
			currentQ = currentQ.substring(0,idx+key.length)+selectOption;
		}
		window.location.href='/en/search?q='+currentQ;
	});
});

