#' USGS Site File Data Retrieval
#'
#' Imports data from USGS site file site. This function gets data from here: \url{http://waterservices.usgs.gov/}
#'
#' @param siteNumbers character USGS site number.  This is usually an 8 digit number
#' @keywords data import USGS web service
#' @return A data frame with at least the following columns:
#' \tabular{lll}{
#' Name \tab Type \tab Description \cr
#' agency_cd \tab character \tab The NWIS code for the agency reporting the data\cr
#' site_no \tab character \tab The USGS site number \cr
#' }
#' Note that code and value are repeated for the parameters requested. The names are of the form 
#' XD_P_S, where X is literal, 
#' D is an option description of the parameter, 
#' P is the parameter code, 
#' and S is the statistic code (if applicable).
#' 
#' There are also several useful attributes attached to the data frame:
#' \tabular{lll}{
#' Name \tab Type \tab Description \cr
#' url \tab character \tab The url used to generate the data \cr
#' queryTime \tab POSIXct \tab The time the data was returned \cr
#' comment \tab character \tab Header comments from the RDB file \cr
#' }

#' @export
#' @examples
#' # These examples require an internet connection to run
#' siteINFO <- readNWISsite('05114000')
#' siteINFOMulti <- readNWISsite(c('05114000','09423350'))
readNWISsite <- function(siteNumbers){
  
  siteNumber <- paste(siteNumbers,collapse=",")
  urlSitefile <- paste("http://waterservices.usgs.gov/nwis/site/?format=rdb&siteOutput=Expanded&sites=",siteNumber,sep = "")
  
  data <- importRDB1(urlSitefile,asDateTime=FALSE)
  
  return(data)
 
}
