#' Pipe functions
#'
#' Like dplyr, anomalyDetection also uses the pipe function, \code{\%>\%} to turn
#' function composition into a series of imperative statements.
#'
#' @importFrom magrittr %>%
#' @name %>%
#' @rdname pipe
#' @export
#' @param lhs,rhs An R object and a function to apply to it
#' @examples
#'
#' x <- matrix(rnorm(200*3), ncol = 10)
#' N <- nrow(x)
#' p <- ncol(x)
#'
#' # Instead of
#' hc <- horns_curve(x)
#' fa <- factor_analysis(x, hc_points = hc)
#' factor_analysis_results(fa, fa_scores_rotated)
#'
#' # You can write
#' horns_curve(x) %>%
#'   factor_analysis(x, hc_points = .) %>%
#'   factor_analysis_results(fa_scores_rotated)
NULL
