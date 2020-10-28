# Preprocesamiento BCI II-III
## El preprocesamiento es el siguiente:
Subconjuntos.m --> Car.m --> FiltroPasaBanda.m --> AcomodarDatos.m

### Subconjuntos.m
Obtenemos los 6 seg de MI del segundo 3 al 9
* Input: (dataset_BCIcomp1.mat)
* Output: (MI_train/test.mat)
* Input Shape: (9x128)x3x140 [(seg x fs) x n canales x n muestras]
* Output Shape: (140x6x128)x3 [(n muestras x seg x fs) x n canales]

### Car.m
Referencia CAR (common average reference)
* Input: (MI_train/test.mat)
* Output: (Car_train/test.mat)
* Input shape: (n_muestra * 768)x3
* Output shape: (n_muestra * 768)x3

### FiltroPasaBanda.m
Filtro pasa banda de 8Hz-30Hz
* Input: (Car_train/test.mat)
* Output: (Filtradas_train/test.mat)
* Input shape: (n_muestra * 768)x3
* Output shape: (n_muestra * 768)x3

### AcomodarDatos.m
Acomodar los datos para que queden concatenados los canales [n_muestras, n_canales]
* Input: (FiltradasBab.mat)
* Output: (MI-EEG-Bab.csv) es para el entrenamiento de los modelos
* Input shape: (n_muestras * 768)x3
* Output shape: n_muestras * 2304

Las filas son el numero de muestras (140) y las columnas son los 6 seg de los 3 canales concatenados (2304)

### Etiquetas.m
Unir etiquetas
* Input: (dataset_BCIcomp1.mat/labels_data_set_iii.mat)
* Output: (etiquetas_train/test.csv)