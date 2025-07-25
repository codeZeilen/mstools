% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/toolStatusMessage.R
\name{toolStatusMessage}
\alias{toolStatusMessage}
\title{toolStatusMessage}
\usage{
toolStatusMessage(status, message, level = 0)
}
\arguments{
\item{status}{status indicator of the messages. Currently either "ok" (check
succesful / quality ok), "note" (check unsuccessful but still acceptable)
or "warn" (check unsuccessful / undesired result).}

\item{message}{message to be triggered.}

\item{level}{as the test result will be linked to a function call, the function
needs to know to which call it should be linked. by default (\code{level = 0}) the parent
function call is being used. Increasing the number by one will let the function go
up by one in the call stack, \code{level = -1} will use \code{toolExpectTrue} itself as
function call.}
}
\description{
tool to trigger status messages describing the data quality at different stages
of processing. Messages are directly written to the log at execution but also
collected to be finally returned as data report.
}
\examples{
toolStatusMessage("ok", "everything is ok", level = -1)
toolStatusMessage("note", "this is not optimal but probably acceptable", level = -1)
toolStatusMessage("warn", "this is not ok", level = -1)
getMadratMessage("status")
}
\seealso{
\code{\link[madrat]{getMadratMessage}}, \code{\link{toolExpectLessDiff}}, \code{\link{toolStatusMessage}}
}
\author{
Jan Philipp Dietrich
}
