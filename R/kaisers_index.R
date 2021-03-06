#' @title Kaiser's Index of Factorial Simplicity
#'
#' @description
#' \code{kaisers_index} computes scores designed to assess the quality of a factor
#' analysis solution. It measures the tendency towards unifactoriality for both
#' a given row and the entire matrix as a whole. Kaiser proposed the evaluations
#' of the score shown below:
#'
#'     \enumerate{
#'       \item In the .90s: Marvelous
#'       \item In the .80s: Meritorious
#'       \item In the .70s: Middling
#'       \item In the .60s: Mediocre
#'       \item In the .50s: Miserable
#'       \item < .50: Unacceptable
#'     }
#'
#' Use as basis for selecting original or rotated loadings/scores in
#' \code{factor_analysis}.
#'
#' @param loadings numerical matrix of the factor loadings
#'
#' @return Vector containing the computed score
#'
#' @references
#'
#' H. F. Kaiser, "An index of factorial simplicity," Psychometrika, vol. 39, no. 1, pp. 31-36, 1974.
#'
#' @seealso
#'
#' \code{\link{factor_analysis}} for computing the factor analysis loadings
#'
#'
#' @examples
#' # Perform Factor Analysis with matrix \code{x}
#' x <- matrix(rnorm(200*3), ncol = 10)
#'
#' x %>%
#'   horns_curve() %>%
#'   factor_analysis(x, hc_points = .) %>%
#'   factor_analysis_results(fa_loadings_rotated) %>%
#'   kaisers_index()
#'
#'@export

kaisers_index <- function(loadings) {

  if(!is.numeric(loadings)) {
    stop("loadings must be numeric")
  }

  N <- nrow(loadings)
  M <- ncol(loadings)

  t2 <- rowSums(loadings ^ 2)
  t4 <- rowSums(loadings ^ 4)

  sum1 <- sum(M * t4[seq_len(M)] - t2[seq_len(M)] ^ 2)
  sum2 <- sum((M - 1) * t2[seq_len(M)] ^ 2)

  result <- sqrt(sum1/sum2)
  return(result)

}
