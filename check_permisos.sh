# Buscar archivos con permisos SUID
find / -perm -4000 -type f 2>/dev/null

# Buscar archivos con permisos SGID
find / -perm -2000 -type f 2>/dev/null

# Buscar archivos con permisos de escritura para todos
find / -perm -0002 -type f 2>/dev/null

# Buscar directorios con permisos de escritura para todos
find / -perm -0002 -type d 2>/dev/null

