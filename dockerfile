# usa a imagem oficial como base
FROM novosga/novosga:2.2-standalone

# copia customizações (ex.: config, scripts)
COPY docker/app/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# opcional: instalar utilitários
USER root
RUN apt-get update && apt-get install -y nano

USER www-data
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
