FROM rabbitmq:3.9.13-management

COPY --chown=rabbitmq:rabbitmq rabbitmq-env.conf /etc/rabbitmq/
COPY --chown=rabbitmq:rabbitmq inter_node_tls.config /etc/rabbitmq/
COPY --chown=rabbitmq:rabbitmq ca_certificate.pem /etc/rabbitmq/
COPY --chown=rabbitmq:rabbitmq *rabbit1*.pem /etc/rabbitmq/
COPY --chown=rabbitmq:rabbitmq rabbit1.conf /etc/rabbitmq/rabbitmq.conf

EXPOSE 15671
EXPOSE 15672
EXPOSE 25672
