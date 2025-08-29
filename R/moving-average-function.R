##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                           ~~
##                    9 Day Moving Average Function                        ----
##                                                                           ~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' 9 Day Moving Average
#'
#' @param focal_date 
#' @param sample_date 
#' @param nutrient_conc 
#' @param win_size_wks
#'
#' @returns
#' @export
#'
#' @examples
#' 
moving_average <- function(focal_date, sample_date, nutrient_conc, win_size_wks) {
  # identifies dates that are within the window
  is_in_window <- (sample_date > focal_date - (win_size_wks / 2) * 7) &
    (sample_date < focal_date + (win_size_wks / 2) * 7)
  # finds the nutrients concentration associated with the identified dates
  window_nut_conc <- nutrient_conc[is_in_window]
  # calculates the means of all of the nutrients within the sample_date
  result <- mean(window_nut_conc, na.rm = TRUE)
  
  return(result)
}
