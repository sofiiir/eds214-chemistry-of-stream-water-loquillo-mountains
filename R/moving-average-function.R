##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                           ~~
##                    9 Day Moving Average Function                        ----
##                                                                           ~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' 9 Day Moving Average
#'
#' @param focal_date A date which the analysis is being centered around
#' @param sample_date A vector of dates of all of the sample dates in the data set
#' @param nutrient_conc A variable that references a numeric column of one nutrient tested  
#' @param win_size_wks A number indicating the number of weeks moving average is based on
#'
#' @returns
#' @export
#'
#' @examples
#' moving_average(focal_date = 1998-03-12, 
#'    sample_date = date_column, 
#'    nutrient_conc = k,
#'    win_size_wks = 9)
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
