install.packages("lubridate")
require(lubridate)

fecha <- ymd("2015-01-01")
fecha2 <- fecha + days(2)
inte <- interval(fecha, fecha2 )

calendario <- read.csv2("~/Dropbox/tools/calendario.csv")
proximos_eventos <- function(calendario) {
    hoy <- now()
    calendario[ymd_hms(calendario$fecha) > hoy, ] ## Con horas es ymd_hms()
}

proximos_eventos(calendario)

fecha3 %within% inte

fecha3 <- ymd("2015-01-02")
