# School-specific overrides for the shared app.
# Copy this file to another repo and keep the same structure when you need to customize colors, logos, APIs, etc.

parse_auth_db_config <- function(path = "auth_db_config.yml") {
  if (!file.exists(path)) return(list())
  lines <- trimws(readLines(path, warn = FALSE))
  lines <- lines[lines != "" & !startsWith(lines, "#")]
  cfg <- list()
  for (line in lines) {
    if (!grepl(":", line)) next
    parts <- strsplit(line, ":", fixed = TRUE)[[1]]
    key <- trimws(parts[1])
    value <- trimws(paste(parts[-1], collapse = ":"))
    cfg[[key]] <- value
  }
  cfg
}

load_neon_config <- function(team_code = "Baylor", yaml_path = "auth_db_config.yml") {
  yaml_cfg <- parse_auth_db_config(yaml_path)
  pick <- function(env_name, yaml_key, default = "") {
    val <- Sys.getenv(env_name, "")
    if (nzchar(val)) return(val)
    yval <- yaml_cfg[[yaml_key]]
    if (!is.null(yval) && nzchar(yval)) return(yval)
    default
  }

  list(
    host = pick("NEON_HOST", "host"),
    port = pick("NEON_PORT", "port", "5432"),
    dbname = pick("NEON_DB", "dbname"),
    user = pick("NEON_USER", "user"),
    pass = pick("NEON_PASSWORD", "password"),
    sslmode = pick("NEON_SSLMODE", "sslmode", "require"),
    schema = pick("NEON_SCHEMA", "schema", "public"),
    table_prefix = pick("NEON_TABLE_PREFIX", "table_prefix", tolower(team_code))
  )
}

default_team_code <- "Baylor"
school_config <- list(
  team_code = default_team_code,
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
    "Bowman, Brock",
    "Daniels, Tyke",
    "Pearson, Blake",
    "Rodriguez, Josiah",
    "James, Brody",
    "Nevarez, Matthew",
    "Nunes, Nolan",
    "Parks, Jaeden",
    "Hill, Grant",
    "McGinnis, Ayden",
    "Morton, Ryker",
    "McGuire, John",
    "Willson, Brandon",
    "Lauterbach, Camden",
    "Turnquist, Dylan",
    "Bournonville, Tanner",
    "Evans, Lincoln",
    "Gnirk, Will",
    "Mann, Tyson",
    "Neneman, Chase",
    "Warmus, Joaquin",
    "Kapadia, Taylor",
    "Stoner, Timothy",
    "Bergloff, Cameron",
    "Hamm, Jacob",
    "Hofmeister, Ben",
    "Moo, Eriksen",
    "Peltz, Zayden",
    "Huff, Tyler",
    "Moseman, Cody"
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
    "crosbyac@vmi.edu"
  ),
  notes_api = list(
    base_url = "https://script.google.com/macros/s/AKfycbzJBeHp7OWGsSGKdS9SF4utandq9nhGZEM3dR59SJ9wvHUqE4Kiw6jXWeyHknbp4F_MSA/exec",
    token = "baylorbaseball"
  ),
  extra = list(
    school_name = "Baylor",
    ftp_folder = "trackman",
    cloudinary_folder = "trackman"
  ),
  neon = load_neon_config(team_code = default_team_code)
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
