# get gdrivepath
gdrivepath = function() {
  systemname=Sys.info()["nodename"]
  switch(systemname,
         'SIDDHARTHA' = {path = 'C:/Users/zhaochenhe/Google Drive/'},
         'IMMANUEL-PC' = {path = 'C:/Users/immanuel/Google Drive/'},
         'Zhaochens-MacBook-Air.local' = {path = '/Users/sterilite/Google Drive/'},
         {print("Unable to identify computer. Assigning value passed from Rprofile.site")
           path = ''}
  )
  return(path)
}

# install if not present
installif = function(libs) {
  new.packages = libs[!(libs %in% installed.packages()[,'Package'])]
  if(length(new.packages)) {install.packages(new.packages)}
}

# Load a string array of packages
lib = function(libs) {
  lapply(libs, library, character.only = TRUE)
}

# combine installif and lib
libif = function(libs) {
  installif(libs)
  lib(libs)
}

#tester = data.frame(systname = 'Zhaochens-MacBook-Air.local', gdrivepath='/Users/sterilite/Google Drive/')

setproj=function(proj) {
  projlist = read.csv(file=paste(gdrivepath(),'research/projlist.txt',sep=''),header=TRUE,stringsAsFactors = F)
  if (class(proj) == 'numeric') {
    if (proj %in% projlist$projnum) {
      projdir = projlist$projpath[projlist$projnum == proj]
      path = paste(gdrivepath(),'research/',projdir,'/proj.R',sep='')
      source(path)
    }
    else {
      print('Project number not found')
    }
  }
  else if (class(proj) == 'character') {
    if (proj %in% projlist$projeasyname) {
      projdir = projlist$projpath[projlist$projeasyname == proj]
      path = paste(gdrivepath(),'research/',projdir,'/proj.R',sep='')
      source(path)
    }
    else {
      print('Project name not found')
    }
  }
}
