
# LIBRARIAS
library(haven)
library(purrr)
library(dplyr)

################################################################################
############################### DATA ###########################################
################################################################################
e2013 = read_sav("data/encuesta2013.sav")
e2014 = read_sav("data/encuesta2014.sav")
e2015 = read_sav("data/encuesta2015.sav")
e2016 = read_sav("data/encuesta2016.sav")
e2017 = read_sav("data/encuesta2017.sav", encoding = "latin1")
e2018 = read_sav("data/encuesta2018.sav", encoding = "latin1")
e2019 = read.csv2("data/encuesta2019.csv")
e2020 = read_sav("data/encuesta2020.sav")
e2021 = read_sav("data/encuesta2021.sav")


################################################################################
######################### LIMPIEZA DE DATOS ####################################
################################################################################

# Escoger por año, las columnas que puedan explicar a salario
e2013 = e2013[,c(
              "ylab",     # Ingreso laboral
              "s2a_02",   # ¿Es hombre o mujer?
              "s2a_03",   # ¿Cuántos años cumplidos tiene?
              "aestudio", # Años de educación
              "niv_ed_g", # Nivel de educación general
              "s6b_14a",#¿Hace cuanto tiempo trabaja en la empreas, etc?(tiempo)
              "s6b_14b",#¿Hace cuanto tiempo trabaja en la empreas, etc?(periodo)
              "tothrs",   # Horas trabajadas a la semana
              "s6b_20"    # ¿Cuántas personas trabajan en la empresa, etc?
              )] 
e2013$año = 2013
e2013$ipc = 0.057
e2013$sueldoMin = 1200

e2014 = e2014[,c(
              "ylab",     # Ingreso laboral
              "s2a_02",   # ¿Es hombre o mujer?
              "s2a_03",   # ¿Cuántos años cumplidos tiene?
              "aestudio", # Años de educación
              "niv_ed_g", # Nivel de educación general
              "s6b_14a", #¿Hace cuanto tiempo trabaja en la empreas,etc?(tiempo)
              "s6b_14b", #¿Hace cuanto tiempo trabaja en la empreas,etc?(periodo)
              "tothrs",   # Horas trabajadas a la semana
              "s6b_20"    # ¿Cuántas personas trabajan en la empresa, etc?
              )] 
e2014$año = 2014
e2014$ipc = 0.058
e2014$sueldoMin = 1440

e2015 = e2015[,c(
              "ylab",     # Ingreso laboral
              "s2a_02",   # ¿Es hombre o mujer?
              "s2a_03",   # ¿Cuántos años cumplidos tiene?
              "aestudio", # Años de educación
              "niv_ed_g", # Nivel de educación general
              "s6b_14a", #¿Hace cuanto tiempo trabaja en la empreas,etc?(tiempo)
              "s6b_14b", #¿Hace cuanto tiempo trabaja en la empreas,etc?(periodo)
              "tothrs",   # Horas trabajadas a la semana
              "s6b_21"    # ¿Cuántas personas trabajan en la empresa, etc?
              )] 
e2015$año = 2015
e2015$ipc = 0.041
e2015$sueldoMin = 1656

e2016 = e2016[,c(
              "ylab",     # Ingreso laboral
              "s02a_02",   # ¿Es hombre o mujer?
              "s02a_03",   # ¿Cuántos años cumplidos tiene?
              "aestudio", # Años de educación
              "niv_ed_g", # Nivel de educación general
              "s06b_14a",#¿Hace cuanto tiempo trabaja en la empreas,etc?(tiempo)
              "s06b_14b",#¿Hace cuanto tiempo trabaja en la empreas,etc?(periodo)
              "tothrs",   # Horas trabajadas a la semana
              "s06b_21"    # ¿Cuántas personas trabajan en la empresa, etc?
              )] 
e2016$año = 2016
e2016$ipc = 0.036
e2016$sueldoMin = 1805

e2017 = e2017[,c(
              "ylab",     # Ingreso laboral
              "s02a_02",   # ¿Es hombre o mujer?
              "s02a_03",   # ¿Cuántos años cumplidos tiene?
              "aestudio", # Años de educación
              "niv_ed_g", # Nivel de educación general
              "s06b_14a",#¿Hace cuanto tiempo trabaja en la empreas,etc?(tiempo)
              "s06b_14b",#¿Hace cuanto tiempo trabaja en la empreas,etc?(periodo)
              "tothrs",   # Horas trabajadas a la semana
              "s06b_21"    # ¿Cuántas personas trabajan en la empresa, etc?
              )] 
e2017$año = 2017
e2017$ipc = 0.028
e2017$sueldoMin = 2000

e2018 = e2018[,c(
              "ylab",     # Ingreso laboral
              "s02a_02",   # ¿Es hombre o mujer?
              "s02a_03",   # ¿Cuántos años cumplidos tiene?
              "aestudio", # Años de educación
              "niv_ed_g", # Nivel de educación general
              "s06b_14a",#¿Hace cuanto tiempo trabaja en la empreas,etc?(tiempo)
              "s06b_14b",#¿Hace cuanto tiempo trabaja en la empreas,etc?(periodo)
              "tothrs",   # Horas trabajadas a la semana
              "s06b_21"    # ¿Cuántas personas trabajan en la empresa, etc?
              )] 
e2018$año = 2018
e2018$ipc = 0.023
e2018$sueldoMin = 2060

e2019 = e2019[,c(
              "ylab",     # Ingreso laboral
              "s02a_02",   # ¿Es hombre o mujer?
              "s02a_03",   # ¿Cuántos años cumplidos tiene?
              "aestudio", # Años de educación
              "niv_ed_g", # Nivel de educación general
              "s06b_15aa",#¿Hace cuanto tiempo trabaja en la empreas,etc?(tiempo)
              "s06b_15ab",#¿Hace cuanto tiempo trabaja en la empreas,etc?(periodo)
              "tothrs",   # Horas trabajadas a la semana
              "s06b_21a"    # ¿Cuántas personas trabajan en la empresa, etc?
              )] 
e2019$año = 2019
e2019$ipc = 0.018
e2019$sueldoMin = 2122


e2018$sueldoMin = 2060
e2020 = e2020[,c(
              "ylab",      # Ingreso laboral
              "s01a_02",   # ¿Es hombre o mujer?
              "s01a_03",   # ¿Cuántos años cumplidos tiene?
              "aestudio",  # Años de educación
              "niv_ed_g",  # Nivel de educación general
              "s04b_11aa",#¿Hace cuanto tiempo trabaja en la empreas,etc?(tiempo)
              "s04b_11ab",#¿Hace cuanto tiempo trabaja en la empreas,etc?(periodo)
              "tothrs",    # Horas trabajadas a la semana
              "s04b_14"    # ¿Cuántas personas trabajan en la empresa, etc?
              )] 
e2020$año = 2020
e2020$ipc = 0.009
e2020$sueldoMin = 2122


e2021 = e2021[,c(
              "ylab",      # Ingreso laboral
              "s01a_02",   # ¿Es hombre o mujer?
              "s01a_03",   # ¿Cuántos años cumplidos tiene?
              "aestudio",  # Años de educación
              "niv_ed_g",  # Nivel de educación general
              "s04b_11aa",#¿Hace cuanto tiempo trabaja en la empreas,etc?(tiempo)
              "s04b_11ab",#¿Hace cuanto tiempo trabaja en la empreas,etc?(periodo)
              "tothrs",    # Horas trabajadas a la semana
              "s04b_14"    # ¿Cuántas personas trabajan en la empresa, etc?
              )] 
e2021$año = 2021
e2021$ipc = 0.007
e2021$sueldoMin = 2164

# Definir los nuevos nombres de las columnas
nuevos_nombres <- c("salario", 
                    "sexo", 
                    "edad", 
                    "años de educ", 
                    "nivel de educ", 
                    "exp tiempo", 
                    "exp periodo", 
                    "horas semana", 
                    "cant pers empresa",
                    "año",
                    "ipc",
                    "sueldoMin")

# Crear una lista con todos los dataframes
lista_df <- list(e2013, e2014, e2015, e2016, e2017, e2018, e2019, e2020, e2021)

# Usar lapply para aplicar as_factor a cada columna de cada dataframe
# y cambia los nombres de las columnas
lista_df <- lapply(lista_df, function(df) {
  df[] <- lapply(df, haven::as_factor)
  colnames(df) <- nuevos_nombres
  return(df)
})

# Combinar dataframes de cada año en df
df <- do.call(rbind, lista_df)

# Elimina los dataframes que ya no se usarán
rm(e2013, e2014, e2015, e2016, e2017, e2018, e2019, e2020, e2021,lista_df,
   nuevos_nombres)

# Especifica las columnas que quieres convertir a numéricas
columnas_a_numericas <- c("salario", 
                          "edad", 
                          "años de educ", 
                          "exp tiempo", 
                          "horas semana", 
                          "cant pers empresa", 
                          "año","ipc",
                          "sueldoMin")

# Recorre cada columna especificada y conviértela a numérica
for (col in columnas_a_numericas) {
  df[[col]] <- as.numeric(as.character(df[[col]]))
}

# Borrar filas de salario que sean NA.
# No nos interesa analizar personas que no tiene salario.
df = df[!is.na(df$salario),]

# Borrar personas menores a 14 años. 
# En 2010 el año mínimo para trabajar fue de 10 años pero para ser práctico
# Decidimos tomar 14 como mínimo.
df$edad <- as.numeric(as.character(df$edad))
df <- subset(df, edad >= 14)

# Borrar filas NA de años de educ
df = df[!is.na(df$`años de educ`),]

# Borrar filas NA de exp periodo
df = df[!is.na(df$`exp periodo`),]

# Borrar filas NA de exp tiempo
df = df[!is.na(df$`exp tiempo`),]

# Borrar filas NA de horas semana
df = df[!is.na(df$`horas semana`),]

# Borrar filas NA de cant pers empresa
df = df[!is.na(df$`cant pers empresa`),]

# Eliminar las filas donde 'nivel de educ' es <NA>, 'Otros', o 'otros'
df <- df[!is.na(df$`nivel de educ`), ]

# Cambiar 'ninguno' a 'Ninguno' en la columna 'nivel de educ', etc
df$`nivel de educ`[df$`nivel de educ` == "ninguno"] <- "Ninguno"
df$`nivel de educ`[df$`nivel de educ` == "secundaria"] <- "Secundaria"
df$`nivel de educ`[df$`nivel de educ` == "primaria"] <- "Primaria"
df$`nivel de educ`[df$`nivel de educ` == "superior"] <- "Superior"
df$`nivel de educ`[df$`nivel de educ` == "otros"] <- "Otros"

# Asegúrar que df es tu data.frame y 'exp periodo' es tu columna
df$'exp periodo' <- as.character(df$'exp periodo')

# Reemplazar 'mes' por 'Mes' donde sea que 'mes' aparezca en la columna 'exp periodo'
df$'exp periodo' <- replace(df$'exp periodo', grepl("mes", df$'exp periodo', ignore.case = TRUE), "Mes")
df$'exp periodo' <- replace(df$'exp periodo', grepl("año", df$'exp periodo', ignore.case = TRUE), "Año")

# Crear un vector con las palabras que quieres buscar
palabras <- c("semana", "Semana", "2. Semana", "8. Año", "2. Semana")

# Eliminar las filas que contienen alguna de las palabras en la columna 
# 'exp periodo'
df <- df[!Reduce("|", lapply(palabras, 
                             function(palabra) grepl(palabra, 
                                                     df$'exp periodo'))), ]

# Asegúrate de que df es tu data.frame y 'exp periodo' es tu columna
df$'exp periodo' <- as.character(df$'exp periodo')

# Convertir la columna 'exp periodo' a "UTF-8"
df$'exp periodo' <- iconv(df$'exp periodo', from = "latin1", to = "UTF-8")

# Reemplazar "8. Año" por "Año"
df$'exp periodo' <- gsub("8. Año", "Año", df$'exp periodo')

# Eliminar las filas que contienen "AÃ±o"
df$'exp periodo' <- gsub("AÃ±o", "Año", df$'exp periodo')



# Convertir los meses en años
df$'exp tiempo' <- ifelse(df$'exp periodo' == "Mes", 
                          ceiling(df$'exp tiempo' / 12), 
                          df$'exp tiempo')

df1 = df
df = df1

# Reemplaza "hombre", "1. Hombre", " 1. Hombre", "1.Hombre" por "Hombre"
df$sexo <- gsub("^hombre$|^1. Hombre$|^ 1. Hombre$|^1.Hombre$", "Hombre", df$sexo)

# Reemplaza "mujer", "2.Mujer", "2. Mujer" por "Mujer"
df$sexo <- gsub("^mujer$|^2.Mujer$|^2. Mujer$", "Mujer", df$sexo)


# Dado el factor inflación tomaremos como base el año 2016 y 
# convertiremos salario nominal a real 
ipc2016 <- 0.023
df$salarioReal <- df$salario / (1 + ipc2016)




# Eliminar columna "exp periodo"
df$`exp periodo` <- NULL

# Exportar .csv
write.csv(df, file = "data/salario.csv", row.names = FALSE)


x0 = data.frame(
  
)
