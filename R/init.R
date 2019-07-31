# get gdrivepath
gdrivepath = function() {
  path = as.character(gdrivepaths[gdrivepaths$sysname == Sys.info()["nodename"],2])
  return(path)
}
