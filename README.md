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

## Build

Para compilar e instalar:

```
git clone https://github.com/inigogutierrez/con.git
cd con
sudo make install
```

## Licencia

Dominio público.
