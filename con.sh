#!/bin/sh
# con: Consulta la Constitución Española desde tu terminal
# License: Public domain

SELF="$0"

get_data() {
	sed '1,/^#EOF$/d' < "$SELF" | tar xz -O "$1"
}

if [ -z "$PAGER" ]; then
	if command -v less >/dev/null; then
		PAGER="less"
	else
		PAGER="cat"
	fi
fi

show_help() {
	exec >&2
	echo "uso: $(basename "$0") [flags] [referencia...]"
	echo
	echo "  -l      listar apartados"
	echo "  -W      sin saltos de línea"
	echo "  -h      mostrar ayuda"
	echo
	echo "  Tipos de referencia:"
	echo "      <Apartado>"
	echo "          Apartado individual"
	echo "      <Apartado>:<Artículo>"
	echo "          Artículo concreto"
	echo "      <Apartado>:<Artículo>:<Punto>[,<Punto>]..."
	echo "          Puntos concretos de un artículo"
	echo "      <Apartado>:<Artículo>-<Artículo>"
	echo "          Rango de artículos"
	echo "      <Apartado>:<Artículo>:<Punto>-<Punto>"
	echo "          Rango de puntos de un artículo"
	echo "      <Apartado>:<Artículo>:<Punto>-<Artículo>:<Punto>"
	echo "          Rango de artículos y puntos"
	echo
	echo "      /<Búsqueda>"
	echo "          Todos los puntos que concuerden con la búsqueda"
	echo "      <Apartado>/<Búsqueda>"
	echo "          Todos los puntos de un apartado que concuerden con la búsqueda"
	echo "      <Apartado>:<Artículo>/<Búsqueda>"
	echo "          Todos los puntos de un artículo que concuerden con la búsqueda"
	exit 2
}

while [ $# -gt 0 ]; do
	isFlag=0
	firstChar="${1%"${1#?}"}"
	if [ "$firstChar" = "-" ]; then
		isFlag=1
	fi

	if [ "$1" = "--" ]; then
		shift
		break
	elif [ "$1" = "-l" ]; then
		# List all book names with their abbreviations
		get_data con.tsv | awk -v cmd=list "$(get_data con.awk)"
		exit
	elif [ "$1" = "-W" ]; then
		export KJV_NOLINEWRAP=1
		shift
	elif [ "$1" = "-h" ] || [ "$isFlag" -eq 1 ]; then
		show_help
	else
		break
	fi
done

cols=$(tput cols 2>/dev/null)
if [ $? -eq 0 ]; then
	export KJV_MAX_WIDTH="$cols"
fi

if [ $# -eq 0 ]; then
	if [ ! -t 0 ]; then
		show_help
	fi

	# Interactive mode
	while true; do
		printf "con> "
		if ! read -r ref; then
			break
		fi
		get_data con.tsv | awk -v cmd=ref -v ref="$ref" "$(get_data con.awk)" | ${PAGER}
	done
	exit 0
fi

get_data con.tsv 2>/dev/null | awk -v cmd=ref -v ref="$*" "$(get_data con.awk)" 2>/dev/null | ${PAGER}
