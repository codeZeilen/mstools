#' toolStatusMessage
#'
#' tool to trigger status messages describing the data quality at different stages
#' of processing. Messages are directly written to the log at execution but also
#' collected to be finally returned as data report.
#'
#' @param status status indicator of the messages. Currently either "ok" (check
#' succesful / quality ok), "note" (check unsuccessful but still acceptable)
#' or "warn" (check unsuccessful / undesired result).
#' @param message message to be triggered.
#' @param level as the test result will be linked to a function call, the function
#' needs to know to which call it should be linked. by default (\code{level = 0}) the parent
#' function call is being used. Increasing the number by one will let the function go
#' up by one in the call stack, \code{level = -1} will use \code{toolExpectTrue} itself as
#' function call.
#' @author Jan Philipp Dietrich
#' @seealso \code{\link[madrat]{getMadratMessage}}, \code{\link{toolExpectLessDiff}}, \code{\link{toolStatusMessage}}
#' @examples
#' toolStatusMessage("ok", "everything is ok", level = -1)
#' toolStatusMessage("note", "this is not optimal but probably acceptable", level = -1)
#' toolStatusMessage("warn", "this is not ok", level = -1)
#' getMadratMessage("status")
#' @export

toolStatusMessage <- function(status, message, level = 0) {
  symbol <- toolSubtypeSelect(status, c(ok = "\u2713", note = "!", warn = "WARNING"))
  message <- paste0("[", symbol, "] ", message)
  vcat(ifelse(status == "warn", 0,1), message, show_prefix = FALSE)
  putMadratMessage("status", message, fname = -2 - level, add = TRUE)
}
