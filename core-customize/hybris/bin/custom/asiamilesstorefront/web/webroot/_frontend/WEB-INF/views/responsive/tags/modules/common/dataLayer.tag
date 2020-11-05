<script>
  window.dataLayer = window.dataLayer || []
  let contextData={
    //   Page/generic
      page_session_id:'',
      page_name:'',
      error_code:'',
      page_country:'',
      page_language:'',
      page_locale:'',
      page_environment:'',
      member_miles_balance:'',
    //   cart
    cart_total_miles:'',
    cart_total_cash:'',
    products:[{
        product_name:'',
        product_variance1:'',
        product_variance2:'',
        product_currency:'',
        product_quantity:'',
    }],
    // PDP
    product_package_code:'',
    product_name:'',
    product_brand:'',
    product_variance1:'',
    product_variance2:'',
    product_currency:'',
    product_delivery:'',
    product_tagA:'',
    product_tagB:'',
    product_quantity:'',
    product_date:'',
    product_partner:'',
    // order history
    order_date:'',
    order_number:'',
    order_value_total_miles:'',
    order_value_total_cash:'',
    // order confirmation
    order_number:'',
    order_email_delivery:'',
    order_sms_delivery:'',
    cart_total_miles:'',
    cart_total_cash:'',
    products:[{
        product_name:'',
        product_brand :'',
        product_variance1:'',
        product_variance2:'',
        product_currency:'',
        product_quantity:'',
    }],
    // PLP
    product_miles_filter:'',
    product_category_filter:'',
    product_keyword_filter:'',
    product_brand_filter:'',
    product_sortby_filter:'',
  }
  window.dataLayer.push(contextData)

  //1获取浏览器名称和版本
  getBrower = ()=>{
    let agent = navigator.userAgent.toLowerCase();
    let browser = { appname: 'unknown', version: '0' };
    if(/(qqbrowser|ubrowser)\D+(\d[\d.]*)/.test(agent)) {//qq浏览器,UC浏览器
      browser.appname = RegExp.$1;
      browser.version = RegExp.$2;
    } else if (/se[\s\.a-zA-Z\d]+metasr/.test(agent)) {
      browser.appname = 'sougou';
      browser.version = '0';
    } else if (/(msie|firefox|opera|chrome|netscape)\D+(\d[\d.]*)/.test(agent)) {
      browser.appname = RegExp.$1;
      browser.version = RegExp.$2;
    } else if (/version\D+(\d[\d.]*).*safari/.test(agent)) { // safari  
      browser.appname = 'safari';
      browser.version = RegExp.$2;
    }
    return browser;
    // console.log(browser);
  }
  //2获取浏览器的操作系统平台
  getPlatform = ()=>{
    let os = {
      platform: navigator.platform.toLowerCase(),
    };
    return os;
  // console.log(os);
  };
  //3获取当前设备类型
  getDevice = ()=>{
    let agent = navigator.userAgent.toLowerCase();
    let result = {
      device: function () {
        if (/windows/.test(agent)) {
          return 'web';
        } else if (/iphone|ipod/.test(agent) && /mobile/.test(agent)) {
          return 'ios';
        } else if (/ipad/.test(agent) && /mobile/.test(agent)) {
          return 'ios';
        } else if (/android/.test(agent) && /mobile/.test(agent)) {
          return 'android';
        } else if (/linux/.test(agent)) {
          return 'web';
        } else if (/mac/.test(agent)) {
          return 'web';
        } else {
          return 'other';
        }
      }(),
    };
    return result;
  };
</script>