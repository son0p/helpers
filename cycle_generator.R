install.packages("lubridate")
install.packages("DT")
# ------- Reuquire
require("DT")
require(lubridate)
# vars


ciclo <- function(n) {
  table <- read.csv2("ciclo1.csv", header = TRUE, sep = ";", row.names = 1)
  inicio <- ymd_hms("2015-10-02 10:00:00")
  deadlines <- c(5, 10, 15, 30, 35, 90, 99, 120, 130, 135)
  fecha <- ymd_hms(n)
  donde <- character(n)
  con_quien <- character(n)
  detalles <- c("")
  duracion <- duration(n)
  tags <- character(n)
  for (i in 1:n) {
    fecha[i] <- inicio + days(as.numeric(table[i,1]))
    donde[i] <- as.character(table[i,2])
    con_quien[i] <- as.character(table[i,3])
    detalles[i] <- as.character(table[i,4])
    duracion[i] <- as.numeric(table[i,5])
    tags[i] <- as.character(table[i,6])
  }
  x <- data.frame(fecha, donde, con_quien,detalles, duracion, tags, stringsAsFactors=FALSE)
  x
     datatable(x, filter = 'top',options = list(autoWidth = TRUE))
}
ciclo(90)

ciclo_tres_meses <- function(){
    #ciclo$fecha <- ymd_hms(ciclo$fecha)
    inicio <- ymd_hms("2015-10-02 10:00:00")
    produccion <- inicio + days(30)
    socializacion <- inicio + days(60)
    x <- data.frame(inicio, produccion, socializacion)
    write.csv(ciclo, file= "~/Dropbox/tools/ciclo1.csv", append=TRUE)
    #View(ciclo)
    #datatable(ciclo, filter = 'top',options = list(autoWidth = TRUE))
}

ciclo_tres_meses()

# insertar cvs
insertar_csv <- function(){

}

# Orientacion

tareas <- read.csv2("~/Dropbox/tools/orientacion.csv")
datatable(tareas, filter = 'top',options = list(autoWidth = TRUE))
