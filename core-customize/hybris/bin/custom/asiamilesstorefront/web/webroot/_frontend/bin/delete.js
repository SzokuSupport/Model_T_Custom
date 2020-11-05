const fs = require('fs-extra'),
	  path = require('path')
	  
function deleteTarget(file) {
  console.log(`deleting files in ${file}`)
  if (!fs.existsSync(file)) return;
	
  if (fs.statSync(file).isDirectory()) {
    let files = fs.readdirSync(file);
    let len = files.length, removeNumber = 0;
		
    if (len > 0) {
      files.forEach(function (item) {
        removeNumber ++;
        let stats = fs.statSync(file + '/' + item);
        let url = file + '/' + item;
        if (fs.statSync(url).isDirectory()) {
          deleteTarget(url);
        } else {
          fs.unlinkSync(url);
        }
      });
			
      if (removeNumber === len) {
        fs.rmdirSync(file);
      } else {
        fs.rmdirSync(file)
      }
    }
  } else {
    fs.unlinkSync(file)
  }
	

  console.log(`deleting success`)
}

// let pathSrc = '../WEB-INF/_ui-src/desktop/dfs/js/refactoring/'
let pathUI = '../_ui/responsive/aml/js'
	
// deleteTarget(pathSrc)
deleteTarget(pathUI)