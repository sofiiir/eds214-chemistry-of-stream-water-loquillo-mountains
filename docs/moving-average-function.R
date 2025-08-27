
#' 9 Day Moving Average
#'
#' @param focal_date 
#' @param dates 
#' @param conc 
#' @param win_size_wks 
#'
#' @returns
#' @export
#'
#' @examples
moving_average <- function(focal_date, sample_date, nutrient_conc, win_size) {
  # Which dates are in the window?
  is_in_window <- (sample_dates > focal_date - (win_size / 2) * 7) &
    (sample_dates < focal_date + (win_size / 2) * 7)
  # Find the associated concentrations
  window_nut_conc <- nutrient_conc[is_in_window]
  # Calculate the mean
  result <- mean(window_nut_conc)
  
  return(result)
}
