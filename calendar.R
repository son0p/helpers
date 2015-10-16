install.packages("lubridate")
require(lubridate)

fecha <- ymd("2015-01-01")
fecha2 <- fecha + days(2)
inte <- interval(fecha, fecha2 )
mes <- interval( now(),(now()+days(30)) )

calendario <- read.csv2("~/Dropbox/tools/calendario.csv")
proximos_eventos <- function(calendario) {
    hoy <- now()
    calendario[ymd_hms(calendario$fecha) > hoy, ] ## Con horas es ymd_hms()
}

proximo_mes <- function(calendario) {
    hoy <- now()
    calendario[ymd_hms(calendario$fecha) %within% mes, ]
}
# Consultas
proximos_eventos(calendario)
proximo_mes(calendario)

fecha3 %within% inte

fecha3 <- ymd("2015-01-02")
