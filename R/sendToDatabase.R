#' @title Send Results to Knowledge Base
#'
#' @description Connect to the cloud knowledge base to store the results obtained to be used in meta-learning of future runs.
#'
#' @return None
#'
#' @examples sendToDatabase()
#'
#' @noRd
#'
#' @import devtools
#' @import rjson
#' @import aws.s3
#' @import datasets
#'
#' @keywords internal

sendToDatabase <- function(){
  #Get IP
  cntIP <- fromJSON(readLines("http://api.hostip.info/get_json.php", warn=F))$ip

  get_bucket(bucket = 'rautoml')
  # write file to S3
  put_object("tmp", object = paste(cntIP,".csv", sep=""), bucket = "rautoml")
}
