install.packages("lubridate")
install.packages("DT")
# ------- Reuquire
require("DT")
require(lubridate)
# vars
mes <- interval( now(),(now()+days(30)) )
# data
calendario <- read.csv2("~/Dropbox/tools/calendario.csv")
# types
calendario$fecha <- ymd_hms(calendario$fecha)
# funciones
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
futuro <- proximos_eventos(calendario)
mes <- proximo_mes(calendario)

# Ver Calendario en consola
View(calendario)
# Ver Todo el calendario en el navegador
datatable(calendario, filter = 'top',options = list(autoWidth = TRUE))
# Ver todo el futuro en el navegador
datatable(futuro, filter = 'top',options = list(autoWidth = TRUE))
# Ver proximo mes en el navegador
datatable(mes, filter = 'top',options = list(autoWidth = TRUE))

# -----------
require("html-widgets")

fecha <- ymd("2015-01-01")
fecha2 <- fecha + days(2)
inte <- interval(fecha, fecha2 )

fecha3 %within% inte

fecha3 <- ymd("2015-01-02")

# Orientacion

tareas <- read.csv2("~/Dropbox/tools/orientacion.csv")
datatable(tareas, filter = 'top',options = list(autoWidth = TRUE))
