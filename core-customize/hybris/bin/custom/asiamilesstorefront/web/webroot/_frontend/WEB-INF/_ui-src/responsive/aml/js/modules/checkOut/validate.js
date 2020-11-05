import '../../plugins/jquery.validate'

/*
 * Add input validation rules
 */
let language = document.getElementsByTagName( 'html' )[0].getAttribute('lang')
let texts = {
  familyNameRequired: {
    en: "Please enter the recipient's family name",
    zh: '请输入收件人姓氏',
    zh_TW: '請輸入收件人姓氏',
    ko: '받으실 분의 성을 입력하세요.',
    ja: '受取人の姓を入力してください',
  },
  familyNameError: {
    en: "Recipient's name contains invalid character(s)",
    zh: '收件人姓名不能含有无效字符',
    zh_TW: '收件人姓名含無效字符',
    ko: '받는 사람의 이름에 유효하지 않은 문자가 포함되어 있습니다.',
    ja: '受取人の名前が正しく入力されていません。',
  },
  mobilePhoneRequired: {
    en: "Please enter the recipient's mobile phone number",
    zh_TW: '请输入收件人的手机号码',
    zh: '請輸入收件人的手機號碼',
    ko: '받는 사람의 휴대전화 번호를 입력하세요',
    ja: '受取人の携帯電話番号を入力してください。',
  },
  mobilePhoneError: {
    en: 'Please enter numeric characters (0-9) only',
    zh_TW: '請輸入數字（只限0-9)',
    zh: '请输入数字字符（只可输入0-9)',
    ko: '숫자(0~9)만 입력 가능합니다.',
    ja: '数字のみ入力してください。',
  },
  companyName: {
    en: "Recipient's company name contains invalid character(s)",
    zh_TW: '收件人的公司名稱含無效字符',
    zh: '收件人公司名称不能含有无效字符',
    ja: '受取人の会社名が正しく入力されていません。',
    ko: '받는 사람의 회사명에 유효하지 않은 문자가 포함되어 있습니다.',
  },
  addressLineRequired: {
    en: "Please enter the recipient's address",
    zh_TW: '請輸入收件地址',
    zh: '请输入收件人的地址',
    ja: '受取人の住所を入力してください。',
    ko: '받는 사람의 주소를 입력하세요.',
  },
  addressLineError: {
    en: "Recipient's address contains invalid character(s)",
    zh_TW: '收件人地址含無效字符',
    zh: '收件人地址不能含有无效字符',
    ja: '受取人の住所が正しく入力されていません。',
    ko: '받는 사람의 주소에 유효하지 않은 문자가 포함되어 있습니다.',
  },
  city: {
    en: "Recipient's city contains invalid character(s)",
    zh_TW: '收件人的城市含無效字符',
    zh: '收件人城市不能含有无效字符',
    ja: '受取人の市町村名が正しく入力されていません。',
    ko: '받는 사람의 도시에 유효하지 않은 문자가 포함되어 있습니다.',
  },
  state: {
    en: "Recipient's state / province / territory contains invalid character(s)",
    zh_TW: '收件人的州／省／縣含無效字符',
    zh: '收件人所在州市／省份／地区不能含有无效字符',
    ja: '受取人の都道府県名が正しく入力されていません。',
    ko: '받는 사람의 주/도/자치령에 유효하지 않은 문자가 포함되어 있습니다. ',
  },
  postal: {
    en: "Recipient's postal / zip code contains invalid character(s)",
    zh_TW: '收件人的州／省／縣含無效字符',
    zh: '收件人邮政编码不能含有无效字符',
    ja: '受取人の郵便番号が正しく入力されていません。',
    ko: '받는 사람의 우편번호에 유효하지 않은 문자가 포함되어 있습니다.',
  },
  email: {
    en: "Please enter a valid recipient's email address",
    zh_TW: '請輸入有效的收件人電郵',
    zh: '请输入有效的收件人电子邮箱',
    ja: '正しいメールアドレスを入力してください。',
    ko: '받는 사람의 이메일 주소를 올바르게 입력해 주세요.',
  },
  lengthLimit: {
    en: 'Exceeds maximum length',
    zh_TW: '已超過最多字數限制',
    zh: '请勿超过最长字数限制',
    ja: '最大文字数を超えています。',
    ko: '허용 글자수 초과',
  }
}
export default function validate(id) {
  let country = $(id).find('#country').val()
  $(id).validate({
    onkeyup: function (element) {
      $(element).parent().find('.J-error-box').hide()
    },
    onfocusout: function (element) {
      $(element).valid();
    },
    rules: {
      familyName: {
        required: true,
        maxlength: 25,
        RecipientName: true,
      },
      givenName: {
        required: false,
        maxlength: 40,
        GivenName: true
      },
      recipientCountryCode: {
        required: true,
      },
      recipientPhoneNo: {
        required: true,
        maxlength: 13,
        number: true,
      },
      companyName: {
        required: false,
        maxlength: 40,
        companyName: true,
      },
      localCompanyName: {
        required: false,
        maxlength: 40,
        localCompanyName: true,
      },
      enAddress1: {
        required: true,
        maxlength: 40,
        addressLine: true,
      },
      enAddress2: {
        required: false,
        maxlength: 40,
        addressLine: true,
      },
      enAddress3: {
        required: false,
        maxlength: 40,
        addressLine: true,
      },
      enCity: {
        required: false,
        maxlength: 32,
        city: true,
      },
      enState: {
        required: false,
        maxlength: 30,
        state: true,
      },
      localAddress1: {
        required: true,
        maxlength: 40,
        localaddressLine: true,
      },
      localAddress2: {
        required: false,
        maxlength: 40,
        localaddressLine: true,
      },
      localAddress3: {
        required: false,
        maxlength: 40,
        localaddressLine: true,
      },
      localCity: {
        required: false,
        maxlength: 32,
        city: true,
      },
      localState: {
        required: false,
        maxlength: 30,
        state: true,
      },
      enPostalCode: {
        postalRequired: true,
        maxlength: 10,
        countryPostal: true,
      },
      localPostalCode: {
        postalRequired: true,
        maxlength: 10,
        countryPostal: true,
      },
      deliveryEmailAddress: {
        required: true,
        maxlength: 50,
        email: true,
      },
      smsDeliveryPhoneNo: {
        required: true,
        maxlength: 13,
        number: true,
      },
      emailAddress: {
        required: true,
        maxlength: 50,
        email: true,
      },
    },
    messages: {
      familyName: {
        required: texts.familyNameRequired[language],
        maxlength: texts.lengthLimit[language]
      },
      givenName: {
        maxlength: texts.lengthLimit[language]
      },
      recipientCountryCode: {
        required: 'Please enter your CountryCode',
      },
      recipientPhoneNo: {
        required: texts.mobilePhoneRequired[language],
        maxlength: texts.lengthLimit[language],
      },
      companyName: {
        maxlength: texts.lengthLimit[language],
      },
      localCompanyName: {
        maxlength: texts.lengthLimit[language]
      },
      enAddress1: {
        required: texts.addressLineRequired[language],
        maxlength: texts.lengthLimit[language]
      },
      enAddress2: {
        maxlength: texts.lengthLimit[language]
      },
      enAddress3: {
        maxlength: texts.lengthLimit[language]
      },
      enCity: {
        maxlength: texts.lengthLimit[language]
      },
      enState: {
        maxlength: texts.lengthLimit[language]
      },
      enPostalCode: {
        postalRequired: texts.addressLineRequired[language],
        maxlength: texts.lengthLimit[language],
        countryPostal: texts.postal[language],
      },
      localAddress1: {
        required: texts.addressLineRequired[language],
        maxlength: texts.lengthLimit[language]
      },
      localAddress2: {
        maxlength: texts.lengthLimit[language]
      },
      localAddress3: {
        maxlength: texts.lengthLimit[language]
      },
      localCity: {
        required: texts.city[language],
        maxlength: texts.lengthLimit[language]
      },
      localState: {
        required: texts.state[language],
        maxlength: texts.lengthLimit[language]
      },
      localPostalCode: {
        postalRequired: texts.addressLineRequired[language],
        maxlength: texts.lengthLimit[language],
        countryPostal: texts.postal[language],
      },
      deliveryEmailAddress: {
        required: texts.email[language],
        maxlength: texts.lengthLimit[language]
      },
      smsDeliveryPhoneNo: {
        required: texts.mobilePhoneRequired[language],
        maxlength: texts.lengthLimit[language]
      },
      emailAddress: {
        required: texts.email[language],
        maxlength: texts.lengthLimit[language]
      }
    },
    showErrors: function (errorMap, errorList) {
      for (let i = 0; i < errorList.length; i++) {
        $(errorList[i].element).parent().find('.J-error-back').text(errorList[i].message)
        $(errorList[i].element).parent().find('.J-error-box').show()
      }
    },
    submitHandler: function (from) {
      if ((id == '#mySelf' || id == '#other') && $(id).find('.J-appellation-title').length > 0) {
        let codeVal = $(id).find('.J-appellation-title').find('.J-code-span').text();
        if (codeVal != '') {
          $(id).find('.J-appellation-title').find('.J-error-box').css('display', 'none');
          from.submit();
        } else {
          $(id).find('.J-appellation-title').find('.J-error-box').css('display', 'block');
        }
      } else {
        from.submit();
      }
    }
  })
  // 自定义校验规则
  $.validator.addMethod('email', function (value) {
    // RFC 822
    // http://jkorpela.fi/rfc/822addr.html or http://www.faqs.org/rfcs/rfc822.html
    // https://gist.github.com/badsyntax/719800
    // https://gomakethings.com/email-validation-in-javascript/
    return new RegExp(/^([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22))*\x40([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d))*(\.\w{2,})+$/).test(value);
  }, texts.email[language]);

  $.validator.addMethod('number', function (value) {
    return new RegExp(/^[0-9]{0,13}$/).test(value);
  }, texts.mobilePhoneError[language]);

  $.validator.addMethod('RecipientName', function (value) {
    return new RegExp(/^[A-Za-z\'\-\s*]{1,25}$/).test(value);
  }, texts.familyNameError[language]);

  $.validator.addMethod('GivenName', function (value) {
    if (value === '') return true
    return new RegExp(/^[A-Za-z\'\-\s*]{1,40}$/).test(value);
  }, texts.familyNameError[language]);

  $.validator.addMethod('companyName', function (value) {
    if (value === '') return true
    return new RegExp(/^[a-zA-Z0-9#&\-\/\,\，\.\。\'\(\（\）\)\s*]{1,40}$/).test(value);
  }, texts.companyName[language]);

  $.validator.addMethod('addressLine', function (value) {
    if (value === '') return true
    return new RegExp(/^[a-zA-Z0-9#&\-\/\,\，\.\。\'\s*]{1,40}$/).test(value);
  }, texts.addressLineError[language]);

  $.validator.addMethod('localaddressLine', function (value) {
    if (value === '') return true
    return new RegExp(/^[\u4e00-\u9fa5\uAC00-\uD7A3\u0800-\u4e00a-zA-Z0-9#&\-\/\,\，\.\。\'\s*]{1,40}$/).test(value);
  }, texts.addressLineError[language]);

  $.validator.addMethod('localCompanyName', function (value) {
    if (value === '') return true
    return new RegExp(/^[\u4e00-\u9fa5\uAC00-\uD7A3\u0800-\u4e00a-zA-Z0-9#&\-\/\,\，\.\。\'\(\（\）\)\s*]{1,40}$/).test(value);
  }, texts.companyName[language]);

  $.validator.addMethod('city', function (value) {
    if (value === '') return true
    return new RegExp(/^[\u4e00-\u9fa5\uAC00-\uD7A3\u0800-\u4e00a-zA-Z0-9#&\-\/\,\，\.\。\'\s*]{1,32}$/).test(value);
  }, texts.city[language]);

  $.validator.addMethod('state', function (value) {
    if (value === '') return true
    return new RegExp(/^[\u4e00-\u9fa5\uAC00-\uD7A3\u0800-\u4e00a-zA-Z0-9\-\,\，\.\。\s*]{1,30}$/).test(value);
  }, texts.state[language]);

  $.validator.addMethod('postalRequired', function (value) {
    if (country === 'CA' || country === 'AU' || country === 'US' || country === 'GB' || country === 'CN') {
      if (value === '') {
        return false
      } else {
        return true
      }
    } else {
      return true
    }
  }, texts.addressLineRequired[language]);

  $.validator.addMethod('countryPostal', function (value) {
    if (country === 'CA') {
      return new RegExp(/^[A-Z][0-9][A-Z]\s[0-9][A-Z][0-9]$/).test(value);
    } else if (country === 'AU') {
      return new RegExp(/^[0-9]{4}$/).test(value);
    } else if (country === 'US') {
      return new RegExp(/^[0-9]{5}$|^[0-9]{5}-[0-9]{4}$/).test(value);
    } else if (country === 'GB') {
      return new RegExp(/^[A-Z]{1,2}[0-9]{1}\s[0-9]{1}[A-Z]{2}$|^[A-Z]{1,2}[0-9]{2}\s[0-9]{1}[A-Z]{2}$|^[A-Z]{1,2}[0-9]{1}[A-Z]{1}\s[0-9]{1}[A-Z]{2}$|^[A-Z]{3}\s[0-9]{1}[A-Z]{2}$/).test(value);
    } else if (country === 'CN') {
      return new RegExp(/^\d{2}(?!9{4})\d{4}$/).test(value);
    } else {
      if (value) {
        return new RegExp(/^[a-zA-Z0-9#\-\s*]{1,10}$/).test(value);
      } else {
        return true
      }
    }
  }, texts.postal[language])
}