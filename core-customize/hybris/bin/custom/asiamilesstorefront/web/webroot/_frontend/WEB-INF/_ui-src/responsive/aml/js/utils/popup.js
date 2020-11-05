/**
 * optimized @9 May, linda.zhu
 * level 1
 * @description product detail images zoom in slick
 * usage:
 *
 * @param {string} selector
 * selector:
 * $('.J-zoomInImages')
 *
 * */
import isIESvg from '../utils/isIESvg'
import isIEImg from '../utils/isIEImg'
import isSmallScreen from '../utils/isSmallScreen';

function _closePopup(selectorClosePopup, $selector) {
    let $overLayout = $('.J-overlayout');

    $('body').on('click', selectorClosePopup, function () {
        $('html,body').removeClass('ovfHiden');

        if (isSmallScreen()) {
            $overLayout.slideUp(300)
        } else {
            $overLayout.removeClass('active')
            $selector.focus()
        }
    })

    $('body').on('keypress', selectorClosePopup, function (e) {
        if (e.keyCode === 13) {
            $('html,body').removeClass('ovfHiden');

            if (isSmallScreen()) {
                $overLayout.slideUp(300)
            } else {
                $overLayout.removeClass('active')
                $selector.focus()
            }
        }
    })
}

function popup(selectorShowPopup, selectorClosePopup, callback) {
    let $overLayout = $('.J-overlayout')

    $('body').on('keypress', selectorShowPopup, function (e) {
        e.preventDefault();
        // IE
        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else {
            window.e.cancelBubble = true;
        }

        let $this = $(this);
        let url = $this.data('url');

        if (e.keyCode === 13) {
            showPopup(url, $this, $overLayout, selectorClosePopup, callback)
        }
    })

    $('body').on('click', selectorShowPopup, function (e) {
        e.preventDefault()
        if (e && e.stopPropagation) {
            // 因此它支持W3C的stopPropagation()方法
            e.stopPropagation();
        } else {
            // 否则，我们需要使用IE的方式来取消事件冒泡
            window.e.cancelBubble = true;
        }

        let $this = $(this);
        let url = $this.data('url')

        showPopup(url, $this, $overLayout, selectorClosePopup, callback)
    })

}

function showPopup(url, $that, $overLayout, selectorClosePopup, callback) {
    $.ajax({
        url: url,
        type: 'get',
        dataType: 'html',
        async: true,
        success: function (data) {
            if (data && data[0] === '{') {
                data = JSON.parse(data);
                if (data.code && data.code === 9999) {
                    window.location.href = data.redirectUrl;
                    return;
                }
            }

            $overLayout.html(data)
            isIESvg()
            isIEImg('.J-overlayout')
            $('html,body').addClass('ovfHiden')
            _closePopup(selectorClosePopup, $that)

            if (isSmallScreen()) {
                $overLayout.slideDown(300)
                if (callback) {
                    callback();
                }
            } else {
                $overLayout.addClass('active')
                $(selectorClosePopup).eq(0).focus()
                if (callback) {
                    callback();
                }
            }
        }
    })
}

export default popup;