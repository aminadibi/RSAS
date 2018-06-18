#' Submits SAS file to console for execution
#' @param SASFile path to the SAS file, without extension
#' @return validation test results
#' @export
sas <- function (SASFile) {

  shellCommand <- paste0("sas.exe -SYSIN ", SASFile, ".sas")
  return.code <- shell(shellCommand)
  #return.code <- shell("sas.exe -SYSIN C://Users//maadibi//Documents//temp//model.sas")
  if (all.equal(return.code, 0)) {
    log <- readLines(paste0(SASFile, ".log"))
    print(log)
  }
  else {
    message("Error")
    return (return.code)
  }
}


