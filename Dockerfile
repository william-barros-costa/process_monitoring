FROM ubuntu:latest AS base
WORKDIR /app

RUN apt-get update && apt-get install -y stress-ng \
    supervisor &&\
    rm -rf /var/lib/apt/lists/*

RUN useradd -m user1 && \
    useradd -m user2

RUN mkdir -p /app/user1 /app/user2
RUN chown user1:user1 /app/user1 && \
    chown user2:user2 /app/user2

RUN cat <<EOF > start_exercise.sh
#!/bin/bash
echo "Starting processes"
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf 1>/dev/null 2>/dev/null &
sleep 1
/bin/bash
EOF

RUN chmod +x start_exercise.sh

CMD ["/app/start_exercise.sh"]

FROM base AS ex1
COPY exercises/ex1.conf /etc/supervisor/conf.d/supervisord.conf

FROM base AS ex2
COPY exercises/ex2.conf /etc/supervisor/conf.d/supervisord.conf

FROM base AS ex3
COPY exercises/ex3.conf /etc/supervisor/conf.d/supervisord.conf

FROM base AS ex4
COPY exercises/ex4.conf /etc/supervisor/conf.d/supervisord.conf

FROM base AS ex5
COPY exercises/ex5.conf /etc/supervisor/conf.d/supervisord.conf

FROM base AS ex6
COPY exercises/ex6.conf /etc/supervisor/conf.d/supervisord.conf

FROM base AS ex7
COPY exercises/ex7.conf /etc/supervisor/conf.d/supervisord.conf

FROM base AS ex8
COPY exercises/ex8.conf /etc/supervisor/conf.d/supervisord.conf
