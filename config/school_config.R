# School-specific overrides for the shared app.
# Copy this file to another repo and keep the same structure when you need to customize colors, logos, APIs, etc.
school_config <- list(
  team_code = "Baylor",
  # Player filters
  allowed_pitchers = c(
    "Perez, Dylan",
    "Woodson, TJ",
    "Clements, Brytton",
    "Dodson, Cade",
    "Kennett, JJ",
    "Riebock, Pearson",
    "Sanders, Travis",
    "Lanclos, Cole",
    "Janusek, Brady",
    "Bergman, Brayden",
    "Armstrong, Tyce",
    "Green, Mason",
    "De La Garza, Robert",
    "Hansen, Cade",
    "Buchanan, Brayden",
    "Snow, Hunter",
    "Deihl, Keegan",
    "McFaddin, Caldwell",
    "McDade, Cash",
    "Caraway, Bo",
    "Johnson, Ty",
    "Waibel, Cade",
    "Wallace, Zack",
    "McLeod, Luke",
    "DeVasher, Luke",
    "Atkinson, Charlie",
    "Bergman, Caleb",
    "Baker, Cayden",
    "Calder, Ethan",
    "Clewett, Camden",
    "Youens, John",
    "Murry, Grayson",
    "Davenport, Lucas",
    "Stahl, Stefan",
    "Bunch, Caleb",
    "Kolkhorst, Jake",
    "Ruais, RJ"
  ),
  allowed_hitters = c(
    "Perez, Dylan",
    "Woodson, TJ",
    "Clements, Brytton",
    "Dodson, Cade",
    "Kennett, JJ",
    "Riebock, Pearson",
    "Sanders, Travis",
    "Lanclos, Cole",
    "Janusek, Brady",
    "Bergman, Brayden",
    "Armstrong, Tyce",
    "Green, Mason",
    "De La Garza, Robert",
    "Hansen, Cade",
    "Buchanan, Brayden",
    "Snow, Hunter",
    "Deihl, Keegan",
    "McFaddin, Caldwell",
    "McDade, Cash",
    "Caraway, Bo",
    "Johnson, Ty",
    "Waibel, Cade",
    "Wallace, Zack",
    "McLeod, Luke",
    "DeVasher, Luke",
    "Atkinson, Charlie",
    "Bergman, Caleb",
    "Baker, Cayden",
    "Calder, Ethan",
    "Clewett, Camden",
    "Youens, John",
    "Murry, Grayson",
    "Davenport, Lucas",
    "Stahl, Stefan",
    "Bunch, Caleb",
    "Kolkhorst, Jake",
    "Ruais, RJ"
  ),
  allowed_campers = c(
    "Bowman, Brock"
  ),
  colors = list(
    primary             = "#003015",   # Baylor green from BU logo
    accent              = "#f5d130",   # Baylor gold highlight
    accent_secondary    = "#007236",   # complementary green shade
    background          = "#ffffff",   # clean light page base
    background_secondary= "#f3f6f1"    # subtle soft background
  ),
  logo = "BUlogo.png",
  coaches_emails = c(
    "Brian_Furlong@Baylor.edu"
  ),
  notes_api = list(
    base_url = "https://script.google.com/macros/s/AKfycbzJBeHp7OWGsSGKdS9SF4utandq9nhGZEM3dR59SJ9wvHUqE4Kiw6jXWeyHknbp4F_MSA/exec",
    token = "baylorbaseball"
  ),
  extra = list(
    school_name = "Baylor",
    ftp_folder = "trackman",
    cloudinary_folder = "trackman"
  )
)

colorize_css <- function(css, accent, accent_secondary, background, background_secondary) {
  accent_rgb <- paste(grDevices::col2rgb(accent), collapse = ",")
  accent_secondary_rgb <- paste(grDevices::col2rgb(accent_secondary), collapse = ",")
  css <- gsub("#e35205", accent, css, fixed = TRUE)
  css <- gsub("#ff8c1a", accent_secondary, css, fixed = TRUE)
  css <- gsub("rgba(227,82,5", paste0("rgba(", accent_rgb), css, fixed = TRUE)
  css <- gsub("rgba(227, 82, 5", paste0("rgba(", accent_rgb), css, fixed = TRUE)
  css <- gsub("rgba(255,140,26", paste0("rgba(", accent_secondary_rgb), css, fixed = TRUE)
  css <- gsub("rgba(255, 140, 26", paste0("rgba(", accent_secondary_rgb), css, fixed = TRUE)
  css <- gsub("#f5f7fa", background, css, fixed = TRUE)
  css <- gsub("#e8ecf1", background_secondary, css, fixed = TRUE)
  css
}
