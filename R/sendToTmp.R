#' @title Write results.
#'
#' @description Append results to a log file.
#'
#' @param df List of the dataset meta-features
#' @param algorithmName String of the name of selected classifier algorithm.
#' @param bestParams String of the best parameters configuration found.
#' @param perf String of the performance value obtained using the selected algorithm and parameter configuration.
#'
#' @return None
#'
#' @examples sendToTmp(\code{df}, 'knn', '1', '0.9').
#'
#' @noRd
#'
#' @keywords internal

sendToTmp <- function(df, algorithmName, bestParams, perf) {
  df$params <- sprintf("'%s'", paste( unlist(bestParams), collapse='#'))
  df$performance <- perf
  df$classifierAlgorithm <- sprintf("'%s'", algorithmName)
  query <- sprintf("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s",
                   df$datasetRatio, df$featuresKurtStdDev, df$featuresKurtMean, df$featuresKurtMax, df$featuresKurtMin, df$featuresSkewStdDev,
                   df$featuresSkewMean, df$featuresSkewMax, df$featuresSkewMin, df$symbolsStdDev, df$symbolsSum, df$symbolsMean, df$classProbStdDev,
                   df$classProbMean, df$classProbMax, df$classProbMin, df$classEntropy, df$ratioNumToCat, df$nCatFeatures, df$nNumFeatures,
                   df$nInstances, df$nFeatures, df$nClasses, df$lognFeatures, df$lognInstances, df$classifierAlgorithm, df$params, df$maxTime, "'acc'",df$performance)
  write(query,file="tmp",append=TRUE)
}
