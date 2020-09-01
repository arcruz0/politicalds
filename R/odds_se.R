#' Standard errors of exponentiated glm coefficients.
#'
#' This function generates the standard errors of exponentiated glm coefficients.
#' The resulting vector is ready for texreg's "override.se =" argument.
#'
#' #' Partially adapted from a blog post by Andrew Heiss (2016).
#'
#' @param model glm model.
#' @return A vector
#' @references \url{https://www.andrewheiss.com/blog/2016/04/25/convert-logistic-regression-standard-errors-to-odds-ratios-with-r/}

#' @examples
#' example_model <- glm(am ~ mpg, family = binomial(), data = mtcars)
#' texreg::screenreg(example_model,
#'                   override.coef    = exp(coef(example_model)),
#'                   override.se      = odds_se(example_model),
#'                   override.pvalues = odds_pvalues(example_model))
#' @importFrom magrittr "%>%"

#' @export
odds_se <- function(model){

  model_df <- broom::tidy(model)

  model_df_extra <- model_df %>%
    dplyr::mutate(hr       = exp(estimate),      # Hazard ratios
                  var_diag = diag(vcov(model)),  # Variance of each coefficient
                  hr_se    = sqrt(hr^2 * var_diag))

  return(model_df_extra$hr_se)
}
