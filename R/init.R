# get gdrivepath
gdrivepath = function() {
  path = as.character(gdrivepaths[gdrivepaths$sysname == Sys.info()["nodename"],2])
  return(path)
}
<<<<<<< HEAD

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

=======
>>>>>>> fd9c0d071705f6939b481ef252659dc3276ca669
