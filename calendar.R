install.packages("lubridate")
install.packages("DT")
require("DT")
require(lubridate)

fecha <- ymd("2015-01-01")
fecha2 <- fecha + days(2)
inte <- interval(fecha, fecha2 )
mes <- interval( now(),(now()+days(30)) )

calendario <- read.csv2("~/Dropbox/tools/calendario.csv")
calendario$fecha <- ymd_hms(calendario$fecha)
proximos_eventos <- function(calendario) {
    hoy <- now()
    calendario[ymd_hms(calendario$fecha) > hoy, ] ## Con horas es ymd_hms()
}

proximo_mes <- function(calendario) {
    hoy <- now()
    result <- calendario[ymd_hms(calendario$fecha) %within% mes, ]
    result[order(result$fecha),]
}

# Consultas
proximos_eventos(calendario)

proximo_mes(calendario)
View(calendario)
datatable(calendario, filter = 'top',options = list(autoWidth = TRUE))

require("html-widgets")


fecha3 %within% inte

fecha3 <- ymd("2015-01-02")
