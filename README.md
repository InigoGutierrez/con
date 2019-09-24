# con

Consulta la Constitución Española desde tu terminal.

Clonado originalmente de [https://github.com/lukesmithxyz/kjv.git](https://github.com/bontibon/kjv.git),
clonado a su vez de [https://github.com/bontibon/kjv.git](https://github.com/bontibon/kjv.git).


## Uso

```
uso: ./con [flags] [referencia...]

  -l      listar apartados
  -W      sin saltos de línea
  -h      mostrar ayuda

  Tipos de referencia:
      Apartado
          Apartado individual
      Apartado:Artículo
          Artículo concreto
      Apartado:Artículo:Punto[,Punto]...
          Puntos concretos de un artículo
      Apartado:Artículo-Artículo
          Rango de artículos
      Apartado:Artículo:Punto-Punto
          Rango de puntos de un artículo
      Apartado:Artículo:Punto-Artículo:Punto
          Rango de artículos y puntos

      /Búsqueda
          Todos los puntos que concuerden con la búsqueda
      Apartado/Búsqueda
          Todos los puntos de un apartado que concuerden con la búsqueda
      Apartado:Artículo/Búsqueda
          Todos los puntos de un artículo que concuerden con la búsqueda
```

## Compilado e instalación

Para compilar e instalar:

```
git clone https://github.com/inigogutierrez/con.git
cd con
sudo make install
```

## Notas

El proyecto original que inspiró `con`, [kjv](https://github.com/bontibon/kjv.git),
se desarrolló para procesar una versión de la Biblia. El código original
apenas ha sido editado, siendo cambiado casi únicamente el archivo que contiene
el texto a procesar, ya que la idea original de este proyecto fue explorar las
posibilidades del editor de texto `vim` sobre un ejemplo real. Es por esto que
`con` no está realmente optimizado para el texto de la Constitución, pero se deja usar.

El comando exacto para consultar el texto de un artículo, por ejemplo, el 155, sería:

`con cuerpo 155`

## Licencia

Dominio público.
