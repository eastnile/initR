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



