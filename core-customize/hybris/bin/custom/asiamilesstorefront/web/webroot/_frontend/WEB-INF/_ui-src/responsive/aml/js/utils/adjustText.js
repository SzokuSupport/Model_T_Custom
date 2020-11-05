import isSmallScreen from '../utils/isSmallScreen'

export default function adjustText(that) {
  // let textWidth = $(that).find('.J-banner-title').width();
  // let wrapperWidth = $(that).width();
  // if ($(that).find('.J-banner-title').css('font-size')) {
  //   let fontSize = $(that).find('.J-banner-title').css('font-size').replace('px', '');
  //
  //   if (textWidth > wrapperWidth) {
  //     $(that).find('.J-banner-title').css('font-size', `${--fontSize}px`);
  //     adjustText(that)
  //   } else {
  //     $(that).find('.J-banner-title').css('line-height', `${fontSize}px`);
  //   }
  // }
  // 最大高度
  let maxHeight = 80;
  let wordBox = $(that).find('.J-banner-title');
  let maxSize = isSmallScreen() ? 36 : 40;
  let minSize = 12;

  wordBox.css('font-size', '12px');
  // 循环修改大小直至大于最大高度
  for (let i = minSize; i <= maxSize; i++) {
    wordBox.css('font-size', i + 'px');
    if (wordBox.height() > maxHeight) {
      // 当容器高度大于最大高度的时候，上一个尝试的值就是最佳大小。
      wordBox.css('font-size', (i - 1) + 'px');
      wordBox.css('opacity', '1');
      // 结束循环
      break;
    } else {
      if (i === maxSize) {
        wordBox.css('opacity', '1');
      }
    }
  }
}