# get gdrivepath
gdrivepath = function() {
  path = as.character(gdrivepaths[gdrivepaths$sysname == Sys.info()["nodename"],2])
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


