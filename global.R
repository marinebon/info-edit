librarian::shelf(
  googledrive, googlesheets4, shiny)

srvc_path <- "~/My Drive/private/shares@nms4gargle.iam.gserviceaccount.com.json"
gs4_deauth()
stopifnot(file.exists(srvc_path))

# https://googlesheets4.tidyverse.org/articles/drive-and-sheets.html
# https://developers.google.com/identity/protocols/oauth2/service-account#delegatingauthority
# https://console.cloud.google.com/iam-admin/serviceaccounts/details/111162214432618062602;edit=true?previousPage=%2Fapis%2Fcredentials%3Fproject%3Dnms4gargle&project=nms4gargle
# https://admin.google.com/ac/owl/domainwidedelegation?hl=en_US
drive_auth(path = srvc_path)
gs4_auth(token = drive_token())

# google sheet: Master_OCNMS_infographic_content
gs <- "https://docs.google.com/spreadsheets/d/1C5YAp77WcnblHoIRwA_rloAagkLn0gDcJCda8E8Efu4/edit"
sheet_names(gs)
sheet_properties(gs)
x <- read_sheet(gs)

drive_find("Master_OCNMS_infographic_content")
